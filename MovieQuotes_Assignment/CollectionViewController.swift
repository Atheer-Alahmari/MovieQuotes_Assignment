//
//  ViewController.swift
//  MovieQuotes_Assignment
//
//  Created by Atheer Alahmari on 17/05/1443 AH.
//

import UIKit
import Kingfisher

class CollectionViewController: UICollectionViewController {
    let name_movie = [
        ["Frozen","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXmd0x2VlkBrdmyDG5NHNJhWVXay_VaM5EpjoZVVJmT4EbIstvVlouSELDbAHwmEkfID0&usqp=CAU"],
        
        ["Toy Story","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSgxTHxJr3Kqm1qtnHURaIs45LgQjveEYJXQ&usqp=CAU.jpeg"],
        
        ["Lion King",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQBmqrRt3JUO3vzVHBKBDpa7GnNTy-l_CAsuxWVCT3Fmht3L8IjrGs7RRlwQOsNOFtXWY&usqp=CAU"],
        
        ["Luca","https://img.youm7.com/ArticleImgs/2021/7/13/58661-Luca--3.jpg"],
        ["Atlantis","https://sainte-anastasie.org/img/images_2/atlantis-una-preciosa-fuente-de-inspiracin-para-nias.jpg"],
        ["Cendrilla","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE9BPYRegeRKtbgvMBUBBbTb_TjNECyDtrbA&usqp=CAU"],
        ["Snow White","https://pbs.twimg.com/media/Ep7AT8qWMAEYsX9.jpg"]
    ]
    
    var listOf_NI :[[String]] = [[]]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func quotation_Action(_ sender: UIBarButtonItem) {
        if listOf_NI.count<4{
            
            let alertVC = UIAlertController.init(title: "Must to choose more than 2 movies" , message: "", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
        else{
        let QuotationQuiz_VC = self.storyboard!.instantiateViewController(withIdentifier:"QuotationQuiz_ViewController") as! QuotationQuiz_ViewController
        QuotationQuiz_VC.listOf_NI = listOf_NI
        self.navigationController?.pushViewController( QuotationQuiz_VC, animated: true)
        }
    }
    
    
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        name_movie.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: Movie_CollectionViewCell.self ), for: indexPath) as! Movie_CollectionViewCell
        
        let item = name_movie[indexPath.row]
        cell.name_Label.text! = item[0]
        
        
        if let url = URL.init(string:item[1]) {
            cell.image_Image.kf.setImage(with: url)
                }

   
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let item = name_movie[indexPath.row]
        if !(listOf_NI.contains(item)){
            listOf_NI += [[ item[0],item[1] ]]
        print(listOf_NI)
        print()
        
        if let cell = collectionView.cellForItem(at: indexPath)
        {
            UIView.animate(withDuration: 0.3, animations: {
                cell.contentView.backgroundColor = .green
            })
        }
        }
//        for i in count{
//            if i[1] != indexPath.row {
//             return
//            }
//            else {
//                if let cell = collectionView.cellForItem(at: indexPath)
//                {
//                    UIView.animate(withDuration: 0.3, animations: {
//                        cell.contentView.backgroundColor = .blue
//                    })
//                }
//            }
//        }
        
    }
//    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//
//
//    }
}
