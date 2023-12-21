import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "Birthday")

        if let newName = storedName as? String {
            nameLabel.text = "Ad: \(newName)"
        }

        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Doğum Günü: \(newBirthday)"
        }
    }

    @IBAction func saveClicked(_ sender: Any) {
        guard let nameText = nameTextField.text, !nameText.isEmpty,
              let birthdayText = birthdayTextField.text, !birthdayText.isEmpty else {
            showAlert(message: "Lütfen ad ve doğum günü bilgilerini girin.")
            return
        }

        UserDefaults.standard.set(nameText, forKey: "name")
        UserDefaults.standard.set(birthdayText, forKey: "Birthday")

        nameLabel.text = "Ad: \(nameText)"
        birthdayLabel.text = "Doğum Günü: \(birthdayText)"

        performSegue(withIdentifier: "SecondVc", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVc" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myNamee = nameTextField.text!
            destinationVC.myBirthdayy = birthdayTextField.text!
        }
    }

    @IBAction func deleteClicked(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "Birthday")

        if (storedName as? String != nil) {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Ad: "
        }

        if (storedBirthday as? String != nil) {
            UserDefaults.standard.removeObject(forKey: "Birthday")
            birthdayLabel.text = "Doğum Günü: "
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
