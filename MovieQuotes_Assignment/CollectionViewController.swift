//
//  ViewController.swift
//  MovieQuotes_Assignment
//
//  Created by Atheer Alahmari on 17/05/1443 AH.
//

import UIKit
import Kingfisher

class CollectionViewController: UICollectionViewController {
    
    let name_movie_Quate = [
        ["Frozen","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXmd0x2VlkBrdmyDG5NHNJhWVXay_VaM5EpjoZVVJmT4EbIstvVlouSELDbAHwmEkfID0&usqp=CAU","Let it go! Let it go! Can't hold it back anymore!"],
        
        ["Toy Story","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSgxTHxJr3Kqm1qtnHURaIs45LgQjveEYJXQ&usqp=CAU.jpeg","To infinity and beyond!"],
        
        ["Lion King",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQBmqrRt3JUO3vzVHBKBDpa7GnNTy-l_CAsuxWVCT3Fmht3L8IjrGs7RRlwQOsNOFtXWY&usqp=CAU","Hakuna Matata, ain't no passing craze.\n It means no worries for the rest of your days.\n It's our problem-free philosophy. \n Hakuna Matata."],
        
        ["Luca","https://img.youm7.com/ArticleImgs/2021/7/13/58661-Luca--3.jpg", "Silenzio Bruno!"],
        ["Atlantis","https://sainte-anastasie.org/img/images_2/atlantis-una-preciosa-fuente-de-inspiracin-para-nias.jpg","You think it's some kind of a diamond. I thought it was some kind of a battery, but we're both wrong. It's their life-force. That crystal is the only thing keeping these people alive! You take that away, and they'll die!"],
        ["Cendrilla","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE9BPYRegeRKtbgvMBUBBbTb_TjNECyDtrbA&usqp=CAU","Oh, it's a beautiful dress! Did you ever see such a beautiful dress? And look! Glass slippers. Why, it's like a dream. A wonderful dream come true."],
        ["Snow White","https://pbs.twimg.com/media/Ep7AT8qWMAEYsX9.jpg","Magic Mirror on the wall, My mirror O my mirror who is the fairest one of all?"]
    ]
    
 
    
    var listOf_NI :[[String]] = [["","",""]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOf_NI.removeAll()

    }
    
    
   // MARK: ----------------------------------quotation_Action-----------------------------------
    
    @IBAction func quotation_Action(_ sender: UIBarButtonItem) {
        if listOf_NI.count<3{
            
            let alertVC = UIAlertController.init(title: "Must to choose more than 2 movies" , message: "", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
        else{
        let QuotationQuiz_VC = self.storyboard!.instantiateViewController(withIdentifier:"QuotationQuiz_ViewController") as! QuotationQuiz_ViewController
        QuotationQuiz_VC.listOf_NI_Q = listOf_NI

            self.navigationController?.pushViewController( QuotationQuiz_VC, animated: true)
            listOf_NI.removeAll()
        }
        
    }
    
    
    
    // MARK: ----------------------------------collectionView-----------------------------------

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        name_movie_Quate.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: Movie_CollectionViewCell.self ), for: indexPath) as! Movie_CollectionViewCell
        
        
        let item = name_movie_Quate[indexPath.row]
        cell.name_Label.text! = item[0]
        
        
        if let url = URL.init(string:item[1]) {
            cell.image_Image.kf.setImage(with: url)
                }

   
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   
        let item = name_movie_Quate[indexPath.row]
        if !(listOf_NI.contains(item)){
            listOf_NI += [[ item[0],item[1] , item[2]]]
        print(listOf_NI)
        print()
        
//        if let cell = collectionView.cellForItem(at: indexPath)
//        {
//            UIView.animate(withDuration: 0.3, animations: {
//                cell.contentView.backgroundColor = .green
//            })
//        }
        }
    }
}
