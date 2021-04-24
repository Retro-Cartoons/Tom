//
//  TomView.swift
//  Tom
//
//  Created by Yusuf Demirci on 30.03.21.
//

@IBDesignable
final public class TomView: UIView {

    // MARK: Properties
    
    public var axisAdapter: UILayoutConstraintAxis = .horizontal {
        didSet {
            setup()
        }
    }
    
    @IBInspectable
    public var lineCount: Int = 8 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable
    public var lineColor: UIColor = .black {
        didSet {
            setup()
        }
    }
    
    @IBInspectable
    public var lineSpacing: CGFloat = 8 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable
    public var minLineHeight: CGFloat = 8 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable
    public var animationSpeed: Double = 0.25 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable
    public var axis: Int {
        get {
            return self.axisAdapter.rawValue
        }
        set {
            self.axisAdapter = NSLayoutConstraint.Axis(rawValue: newValue) ?? .horizontal
        }
    }
    
    private let stackView: UIStackView = {
        let view: UIStackView = .init()
        view.distribution = .fillEqually
        return view
    }()

    private var lineViews: [LineView] = []
    private var isAnimationEnabled: Bool = false
    
    public init(configuration: Configuration) {
        super.init(frame: .zero)
        
        self.lineCount = configuration.lineCount
        self.lineColor = configuration.lineColor
        self.lineSpacing = configuration.lineSpacing
        self.minLineHeight = configuration.minLineHeight
        self.animationSpeed = configuration.animationSpeed
        self.axis = configuration.axis.rawValue
        
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
}

// MARK: - Publics
public extension TomView {

    func start() {
        isAnimationEnabled = true

        lineViews.forEach { [weak self] lineView in
            self?.animate(lineView: lineView)
        }
    }

    func stop() {
        isAnimationEnabled = false

        lineViews.forEach { [weak self] lineView in
            lineView.heightConstraint?.constant = minLineHeight

            UIView.animate(withDuration: animationSpeed) {
                self?.layoutIfNeeded()
            }
        }
    }
}

// MARK: - Privates
private extension TomView {

    func setup() {
        stackView.spacing = self.lineSpacing
        stackView.axis = self.axisAdapter

        stackView.removeFromSuperview()
        self.addSubview(stackView)
        stackView.pinView(to: self)

        addLinesToStackView()
    }

    func animate(lineView: UIView) {
        guard let maxHeight = lineView.superview?.frame.height else { return }

        let newHeight = CGFloat.random(in: minLineHeight...maxHeight)
        lineView.heightConstraint?.constant = newHeight

        UIView.animate(withDuration: animationSpeed) { [weak self] in
            self?.layoutIfNeeded()
        } completion: { [weak self] _ in
            if self?.isAnimationEnabled ?? false {
                self?.animate(lineView: lineView)
            }
        }
    }

    func addLinesToStackView() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        lineViews.removeAll()
        
        for _ in 0 ..< lineCount {
            let lineView: LineView = .init(
                configuration: .init(
                    color: self.lineColor,
                    cornerRadius: .rounded
                )
            )

            let containerView: UIView = .init()
            containerView.addSubview(lineView)

            setLineConstraints(lineView: lineView, containerView: containerView)

            stackView.addArrangedSubview(containerView)
            lineViews.append(lineView)
        }
    }

    func setLineConstraints(lineView: UIView, containerView: UIView) {
        lineView.translatesAutoresizingMaskIntoConstraints = false

        lineView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        lineView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: minLineHeight).isActive = true
        lineView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        lineView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
    }
}
