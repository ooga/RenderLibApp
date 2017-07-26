import Render

class TestController: ViewController, ComponentController {
    var component = CounterComponent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addComponentToViewControllerHierarchy()
    }
    
    override func viewDidLayoutSubviews() {
        renderComponent()
    }
    
    func configureComponentProps() {
        
    }
}
