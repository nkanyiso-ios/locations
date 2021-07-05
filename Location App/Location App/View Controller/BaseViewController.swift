import UIKit
class BaseViewController: UIViewController {
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private let greyView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showIndicator() {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0,y: 0,width: 50,height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        
        greyView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        greyView.backgroundColor = UIColor.black
        greyView.alpha = 0.5
        self.view.addSubview(greyView)
    }

    func hideIndicator() {
        self.activityIndicator.stopAnimating()
        self.greyView.removeFromSuperview()
    }
}
