import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!

    var myNamee = ""
    var myBirthdayy = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Ad: \(myNamee)"
        birthdayLabel.text = "Doğum Günü: \(myBirthdayy)"
    }
}
