//
//  TomView.swift
//  Tom
//
//  Created by Yusuf Demirci on 30.03.21.
//

@IBDesignable
final public class TomView: UIView {

    // MARK: Properties

    private let stackView: UIStackView = {
        let view: UIStackView = .init()
        view.distribution = .fillEqually
        return view
    }()

    private var lineViews: [LineView] = []
    private var isAnimationEnabled: Bool = false

    private var configuration = Configuration(lineCount: 4, lineColor: .black)
    
    public var axisAdapter: UILayoutConstraintAxis = .horizontal
    @IBInspectable public var lineCount: Int = 8
    @IBInspectable public var lineColor: UIColor = .black
    @IBInspectable public var lineSpacing: CGFloat = 8
    @IBInspectable public var minLineHeight: CGFloat = 8
    @IBInspectable public var animationSpeed: Double = 0.25
    @IBInspectable public var axis: Int {
        get {
            return self.axisAdapter.rawValue
        }
        set (axisType) {
            self.axisAdapter = NSLayoutConstraint.Axis(rawValue: axisType) ?? .horizontal
        }
    }
    
    public init(configuration: Configuration) {
        super.init(frame: .zero)
        
        self.configuration = configuration
        self.axis = axisAdapter.rawValue
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.configuration = Configuration(lineCount: self.lineCount,
                                           lineColor: self.lineColor,
                                           spacing: self.lineSpacing,
                                           minLineHeight: self.minLineHeight,
                                           animationSpeed: self.animationSpeed)
        self.axis = self.axisAdapter.rawValue
        
        setup()
        layoutIfNeeded()
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
            lineView.heightConstraint?.constant = self?.minLineHeight ?? 8

            UIView.animate(withDuration: self?.animationSpeed ?? 0.25) {
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

        self.addSubview(stackView)
        stackView.pinView(to: self)

        addLinesToStackView()
    }

    func animate(lineView: UIView) {
        guard let maxHeight = lineView.superview?.frame.height else { return }

        let newHeight = CGFloat.random(in: self.minLineHeight...maxHeight)
        lineView.heightConstraint?.constant = newHeight

        UIView.animate(withDuration: self.animationSpeed) { [weak self] in
            self?.layoutIfNeeded()
        } completion: { [weak self] _ in
            if self?.isAnimationEnabled ?? false {
                self?.animate(lineView: lineView)
            }
        }
    }

    func addLinesToStackView() {
        for _ in 0 ..< self.lineCount {
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
        lineView.heightAnchor.constraint(equalToConstant: self.minLineHeight).isActive = true
        lineView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        lineView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
    }
}
