//
//  QuizViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [AnyObject]()
    
    //正解数
    var correctAnswer:Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [AnyObject]()
        
        //------------------------ここから下にクイズを書く------------------------//
        tmpArray.append(["ジジは何色","黒","白","三毛",1])
        tmpArray.append(["メイのお姉ちゃんは誰？","キキ","ネネ","さつき",3])
        tmpArray.append(["カオナシが食べたのは何？","カエル","エビフライ","ことだま",1])
        tmpArray.append(["アシタカの相棒は？","オーム","ヤックル","アレン",2])
        tmpArray.append(["メイのお母さんの病院は？","井の頭病院","七国山病院","国立病院",2])
        tmpArray.append(["ハクは何の神様？","川","海","龍",1])
        tmpArray.append(["もののけ姫に出てくる病気とは？","イタイイタイ病","風邪","ハンセン病",3])
        tmpArray.append(["マーニーの目の色は？","緑","赤","青",3])
        tmpArray.append(["雫の趣味は？","読書","ねこあつめ","乗り鉄",1])
        tmpArray.append(["キキのリボンは何色？","赤","ピンク","紺",1])
        tmpArray.append(["ナウシカが持っている実は？","クコの実","チコの実","ミコの実",1])
        tmpArray.append(["雫の作ったカントリーロードの都会バージョンとは？","高速ロード","鉄筋コンクリートロード","コンクリートロード",3])
        tmpArray.append(["死の七日間をつくった化け物は？","ロボット兵","巨神兵","足軽",2])
        tmpArray.append(["テトは何？","キツネリス","クルミリス","キツネ犬",1])
        tmpArray.append(["ハウルの髪はもともと何色？","黒","茶色","金色",3])
        tmpArray.append(["キキが箒の代わりに使ったものは？","突っ張り棒","デッキブラシ","熊手",2])
        tmpArray.append(["湯婆婆の姉は？","氷婆婆","水婆婆","銭婆婆",3])
        tmpArray.append(["ソフィーは何屋さんだった？","パン屋","帽子屋","お花屋",2])
        tmpArray.append(["アリエッテイの髪留めはなに？","洗濯バサミ","クリップ","ピン",1])
        tmpArray.append(["ゲド戦記がたどり着く街の名前は？","ホート・タウン","クエン・タウン","マサラ・タウン",1])
        tmpArray.append(["メイがトトロに初めて会った時に言った言葉は？","トトロ！っていうのね？","大きい！！なんでこんなに大きいの？","あなたはだあれ？まっくろくろすけ？",3])
        tmpArray.append(["キキが出発する夜の月は？","三日月","満月","新月",2])
        tmpArray.append(["シータがもっている石は？","飛行石","岩石","ダイヤモンド",1])
        tmpArray.append(["雫のお母さんは何？","専業主婦","OL","大学生",3])
        tmpArray.append(["風邪の谷で唯一汚れているのは？","人間","水","土",3])
        tmpArray.append(["千尋をかくまったおじいさんは？","髭爺","釜爺","蜘蛛爺",2])
        tmpArray.append(["ナウシカの乗り物は？","飛行船","メーベ","ハイヤー",2])
        tmpArray.append(["雫と誠司のデートスポットといえば？","公園","遊園地","図書館",3])
        tmpArray.append(["この中で一番古いジブリ作品は？","もののけ姫","となりのトトロ","風邪の谷のナウシカ",3])
        tmpArray.append(["天空の城ラピュタの呪文といえば？","バルス！","マルス！","ボウズ！",1])
        
        //------------------------ここから上にクイズを書く------------------------//
        
        // 問題をシャッフルしてquizArrayに格納する
        while (tmpArray.count > 0) {
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()
    }
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as! String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, forState: .Normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, forState: .Normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, forState: .Normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
        }
        
        quizArray.removeAtIndex(0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


