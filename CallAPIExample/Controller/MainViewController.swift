//
//  MainViewController.swift
//  CallAPIExample
//
//  Created by imac-1763 on 2023/2/3.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var aqiTableView: UITableView!
    var aqiArray: [AQIResponse.Records] = []
    var newArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTapper()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        print(UserPreferences.shared.lastSelectCounty)
        print(UserPreferences.shared.lasetSelcetStatus)
        print(UserPreferences.shared.lasetSelectAQI)
    }
    private func setupUI(){
        setupButton()
        setupTableView()
        setupTextField()
    }
    private func setupTextField(){
        numberTextField.placeholder = "請輸入查詢筆數"
        numberTextField.keyboardType = .numberPad
        numberTextField.text = UserPreferences.shared.lastSearchNum
    }
    private func setupButton(){
        searchButton.setTitle("開始查詢", for: .normal)
    }
    private func setupTableView(){
        aqiTableView.delegate = self
        aqiTableView.dataSource = self
        aqiTableView.register(UINib(nibName: "AQITableViewCell", bundle: nil), forCellReuseIdentifier: AQITableViewCell.identifier)
        
    }
    //按鈕事件
    @IBAction func searchClick(_sender: UIButton){
        //判斷是否有輸入值
        guard let text = numberTextField.text, !text.isEmpty else {
            return
        }
        UserPreferences.shared.lastSearchNum = text
        NetWorkManager.shared.requestData(offset: 0, limit: text.toInt()){ (respones: AQIResponseResult) in
            switch respones{
            case .success(let results):
                self.aqiArray = results.records
                DispatchQueue.main.async {
                    self.aqiTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
//擴展 Class
extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aqiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AQITableViewCell.identifier,
                                                       for: indexPath) as? AQITableViewCell else{
            fatalError("AQITableViewCell Load Failed!")
        }
        cell.setupInit(country: aqiArray[indexPath.row].county, status: aqiArray[indexPath.row].status, aqi: aqiArray[indexPath.row].aqi.toInt())
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newArray = []
        UserPreferences.shared.lastSelectCounty = aqiArray[indexPath.row].county
        UserPreferences.shared.lasetSelcetStatus = aqiArray[indexPath.row].status
        UserPreferences.shared.lasetSelectAQI = aqiArray[indexPath.row].aqi
        tableView.deselectRow(at: indexPath, animated: true)
        let nextVC = DetailViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
