//
//  QuotationQuiz_ViewController.swift
//  MovieQuotes_Assignment
//
//  Created by Atheer Alahmari on 17/05/1443 AH.
//

import UIKit

class QuotationQuiz_ViewController: UIViewController {
    var listOf_NI :[[String]]?
    //  listOf_Q += [[ item[0],item[1] ]]
    var currentQuestion = 0
    let listOf_Q = [
        ("Frozen","Let it go! Let it go! Can't hold it back anymore!"),
        
        ("Toy Story","To infinity and beyond!"),
        
        ("Lion King","Hakuna Matata, ain't no passing craze.\n It means no worries for the rest of your days.\n It's our problem-free philosophy. \n Hakuna Matata."),
        
        ("Luca", "Silenzio Bruno!"),

        ("Atlantis","You think it's some kind of a diamond. I thought it was some kind of a battery, but we're both wrong. It's their life-force. That crystal is the only thing keeping these people alive! You take that away, and they'll die!"),

        ("Cendrilla","Oh, it's a beautiful dress! Did you ever see such a beautiful dress? And look! Glass slippers. Why, it's like a dream. A wonderful dream come true."),
        ("Snow White","Magic Mirror on the wall, My mirror O my mirror who is the fairest one of all?")

    ]

    
    @IBOutlet weak var answer_TF: UITextField!
    @IBOutlet weak var quotation_Label: UILabel!
    @IBOutlet weak var image_CorrectAns: UIImageView!
    @IBOutlet weak var score_Label: UILabel!
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
        print(listOf_Q)
    }
    
    @IBAction func showAnswer_Action(_ sender: UIButton) {
        
        let alertVC = UIAlertController.init(title: "Show Answer" , message: "You will lose a point on your score", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "Go Back", style: .cancel, handler: nil))
        alertVC.addAction(UIAlertAction.init(title: "Show Answer", style: .cancel, handler: {UIActionHandler in
            
            self.show_Answer()
        }))
        self.present(alertVC, animated: true, completion: nil)
        image_CorrectAns.isHidden = true
        updateUI()
    }
    
    func show_Answer(){
        image_CorrectAns.isHidden = false
        let item = listOf_NI![currentQuestion]
        let url = URL.init(string:item[1])
           image_CorrectAns.kf.setImage(with: url)
             
        
        
        
    }
    @IBAction func checkAnswer_Action(_ sender: UIButton) {
        
        if answer_TF.text?.lowercased() ==  listOf_Q[currentQuestion].0.lowercased(){
            score += 1
            let alertVC = UIAlertController.init(title: "\(answer_TF.text) is Correct Answer" , message: "", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction.init(title: "ok", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            if(currentQuestion < listOf_Q.count-1){
                currentQuestion += 1
            }
            else{
                currentQuestion = 0
            }
            
            updateUI()
        }
        else {
            let alertVC = UIAlertController.init(title: "Try Againr" , message: "", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction.init(title: "ok", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
        
        
        
        
        
        // else set currentQuestion to 0
       
    
    }
    func updateUI() {
        
   
        quotation_Label.text = listOf_Q[currentQuestion].1
        // set answerLabel's text to equal quizBank[currentQuestion].1
        
    }
    
}
