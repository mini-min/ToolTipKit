// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import SnapKit

final public class ToolTipView: UIView, BaseToolTipView {
    
    public enum TipType {
        case top, bottom, left, right
    }
    
    /**
     Default Settings of the ToolTip.
     */
    public static var DEFAULT_BACKGROUND_COLOR: UIColor = .black
    public static var DEFAULT_FOREGROUND_COLOR: UIColor = .white
    
    // MARK: - Properties
    
    @IBInspectable public var baseBackgroundColor: UIColor! {
        didSet {
            self.tipPathView = ToolTipPathViewFactory.makeToolTipPathView(tipType: tipType, color: baseBackgroundColor)
            setupStyle()
            setupHierarchy()
            setupLayout()
        }
    }
    
    @IBInspectable public var baseForegroundColor: UIColor! {
        didSet {
            setupStyle()
        }
    }
        
    public private(set) var isShow: Bool = false
        
    private let title: String
    private let tipType: TipType
    
    // MARK: - UI Components
    
    private weak var sourceView: UIView?
    
    private let containerView = UIView()
    private let tipLabel = UILabel()
    private var tipPathView: ToolTipPathView
    
    // MARK: - Life Cycles
    
    public init(
        title: String,
        type: TipType,
        sourceItem: AnyObject,
        baseBackgroundColor: UIColor = ToolTipView.DEFAULT_BACKGROUND_COLOR,
        baseForegroundColor: UIColor = ToolTipView.DEFAULT_FOREGROUND_COLOR
    ) {
        self.title = title
        self.tipType = type
        self.sourceView = (sourceItem as? UIView) ?? sourceItem.view
        
        self.tipPathView = ToolTipPathViewFactory.makeToolTipPathView(
            tipType: tipType,
            color: baseBackgroundColor
        )
        super.init(frame: .zero)
        
        self.baseBackgroundColor = baseBackgroundColor
        self.baseForegroundColor = baseForegroundColor
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show() {
        guard !isShow, let sourceView else { return }
        isShow = true
        
        setupTooltipLayoutBySourceView()
        self.alpha = 0
        self.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        
        let finalPosition: CGPoint
        switch tipType {
        case .top:
            finalPosition = CGPoint(
                x: sourceView.center.x,
                y: sourceView.frame.minY
            )
        case .bottom:
            finalPosition = CGPoint(
                x: sourceView.center.x,
                y: sourceView.frame.maxY
            )
        case .left:
            finalPosition = CGPoint(
                x: sourceView.frame.minX - self.frame.width / 2,
                y: sourceView.center.y
            )
        case .right:
            finalPosition = CGPoint(
                x: sourceView.frame.maxX + self.frame.width / 2,
                y: sourceView.center.y
            )
        }
        self.center = CGPoint(
            x: sourceView.center.x,
            y: sourceView.center.y
        )
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: [.curveEaseInOut],
            animations: { [weak self] in
                guard let self else { return }
                self.alpha = 1
                self.transform = CGAffineTransform.identity
                self.center = finalPosition
            })
    }
    
    public func hide() {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: [.curveEaseInOut],
            animations: { [weak self] in
                guard let self else { return }
                guard self.isShow else { return }
                self.isShow = false
                self.alpha = 0
            }
        )
    }
    
    public func showWithTimeout(duration: Int) {
        show()
        DispatchQueue.main.asyncAfter(
            deadline: .now() + .seconds(duration)
        ) { [weak self] in
            self?.hide()
        }
    }
}

// MARK: - Private Extensions

private extension ToolTipView {
    func setupStyle() {
        backgroundColor = .clear
        
        tipPathView.backgroundColor = .clear
        
        containerView.backgroundColor = baseBackgroundColor
        containerView.layer.cornerRadius = 8
        
        tipLabel.text = title
        tipLabel.numberOfLines = 2
        tipLabel.font = .systemFont(ofSize: 12, weight: .medium)
        tipLabel.textColor = baseForegroundColor
        tipLabel.textAlignment = .center
    }
    
    func setupHierarchy() {
        [tipPathView, containerView].forEach { addSubview($0) }
        containerView.addSubview(tipLabel)
    }
    
    func setupLayout() {
        tipPathView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(9)
        }
        
        tipLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    func setupTooltipLayoutBySourceView() {
        guard let sourceView else { return }
        
        switch tipType {
        case .top:
            self.snp.makeConstraints {
                $0.bottom.equalTo(sourceView.snp.top).offset(-8)
                $0.centerX.equalTo(sourceView.snp.centerX)
            }
        case .bottom:
            self.snp.makeConstraints {
                $0.top.equalTo(sourceView.snp.bottom).offset(8)
                $0.centerX.equalTo(sourceView.snp.centerX)
            }
        case .left:
            self.snp.makeConstraints {
                $0.right.equalTo(sourceView.snp.left).offset(-8)
                $0.centerY.equalTo(sourceView.snp.centerY)
            }
        case .right:
            self.snp.makeConstraints {
                $0.left.equalTo(sourceView.snp.right).offset(8)
                $0.centerY.equalTo(sourceView.snp.centerY)
            }
        }
    }
}
