//
//  TomView.swift
//  Tom
//
//  Created by Yusuf Demirci on 30.03.21.
//

@IBDesignable
final public class TomView: UIView {

    // MARK: Properties
    
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
    public var minLineThickness: CGFloat = 8 {
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
    public var Vertical: Bool {
        get {
            return self.axis == .vertical
        }
        set {
            self.axis = newValue ? .vertical : .horizontal
        }
    }

    private var axis: UILayoutConstraintAxis = .horizontal {
        didSet {
            setup()
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
        self.minLineThickness = configuration.minLineThickness
        self.animationSpeed = configuration.animationSpeed
        self.axis = configuration.axis
        
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

    /// Starts animation for each lines
    func start() {
        isAnimationEnabled = true

        lineViews.forEach { [weak self] lineView in
            self?.animate(lineView: lineView)
        }
    }

    /// Stops animation for each lines
    func stop() {
        isAnimationEnabled = false

        lineViews.forEach { [weak self] lineView in
            switch axis {
            case .horizontal:
                lineView.heightConstraint?.constant = minLineThickness
            case .vertical:
                lineView.widthConstraint?.constant = minLineThickness
            }

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
        stackView.axis = self.axis

        stackView.removeFromSuperview()
        self.addSubview(stackView)
        stackView.pinView(to: self)

        addLinesToStackView()
    }

    func animate(lineView: UIView) {
        switch axis {
        case .horizontal:
            guard let maxHeight = lineView.superview?.frame.height else { return }

            let newHeight = CGFloat.random(in: minLineThickness...maxHeight)
            lineView.heightConstraint?.constant = newHeight

            UIView.animate(withDuration: animationSpeed) { [weak self] in
                self?.layoutIfNeeded()
            } completion: { [weak self] _ in
                if self?.isAnimationEnabled ?? false {
                    self?.animate(lineView: lineView)
                }
            }
        case .vertical:
            guard let maxWidth = lineView.superview?.frame.width else { return }

            let newWidth = CGFloat.random(in: minLineThickness...maxWidth)
            lineView.widthConstraint?.constant = newWidth

            UIView.animate(withDuration: animationSpeed) { [weak self] in
                self?.layoutIfNeeded()
            } completion: { [weak self] _ in
                if self?.isAnimationEnabled ?? false {
                    self?.animate(lineView: lineView)
                }
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

        lineView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        lineView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true

        switch axis {
        case .horizontal:
            lineView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
            lineView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: minLineThickness).isActive = true
        case .vertical:
            lineView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
            lineView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
            lineView.widthAnchor.constraint(equalToConstant: minLineThickness).isActive = true
        }
    }
}
