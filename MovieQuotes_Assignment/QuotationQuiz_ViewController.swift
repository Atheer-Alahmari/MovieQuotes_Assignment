//
//  QuotationQuiz_ViewController.swift
//  MovieQuotes_Assignment
//
//  Created by Atheer Alahmari on 17/05/1443 AH.
//

import UIKit

class QuotationQuiz_ViewController: UIViewController {
    
    @IBOutlet weak var answer_TF: UITextField!
    @IBOutlet weak var quotation_Label: UILabel!
    @IBOutlet weak var score_Label: UILabel!
    
    var listOf_NI_Q : [[String]]?
    var currentQuestion = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        print(listOf_NI_Q!.count)
        updateUI()
    }
    
    // MARK: ---------------------------------All Action ------------------------------------------
    
    //--------------showAnswer_Action
    
    @IBAction func showAnswer_Action(_ sender: UIButton) {
        if(currentQuestion < listOf_NI_Q!.count){
           
        let alertVC = UIAlertController.init(title: "Show Answer" , message: "You will lose a point on your score", preferredStyle: .alert )
        alertVC.addAction(UIAlertAction.init(title: "Go Back", style: .default, handler: nil))
        alertVC.addAction(UIAlertAction.init(title: "Show Answer", style: .default, handler: {UIActionHandler in
            
            self.show_Answer()
        }))
            
        self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    //----------------------checkAnswer_Action
    @IBAction func checkAnswer_Action(_ sender: UIButton) {
        if(currentQuestion < listOf_NI_Q!.count){

        if answer_TF.text?.lowercased() ==  listOf_NI_Q![currentQuestion][0].lowercased(){
            score += 1
            score_Label.text = "Score : \(score)"
            let alertVC = UIAlertController.init(title: "\(answer_TF.text!) is Correct Answer" , message: "", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction.init(title: "ok", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
                currentQuestion += 1
            updateUI()
            
            }else {
                let alertVC = UIAlertController.init(title: "Try Againr" , message: "", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction.init(title: "ok", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
                answer_TF.text = ""
            }
        }
       
    
    }
    
    // -------------------backToMovies_Action
    @IBAction func backToMovies_Action(_ sender: UIButton) {
         navigationController?.popViewController(animated: true)

    }
    
   //MARK: --------------------------functions-----------------------------
    
    func show_Answer(){

        let QuotationQuiz_VC = self.storyboard!.instantiateViewController(withIdentifier:"ImageAnswer_ViewController") as! ImageAnswer_ViewController
        
        
        let item = listOf_NI_Q![currentQuestion]
            QuotationQuiz_VC.linkImage_CorrectAns = item[1]
        self.navigationController?.pushViewController( QuotationQuiz_VC, animated: true)
        currentQuestion += 1
        updateUI()

    }
    
    func updateUI() {
        
        answer_TF.text = ""
        if(currentQuestion < listOf_NI_Q!.count){
        quotation_Label.text = listOf_NI_Q![currentQuestion][2]
        }
    }
    
    
}
