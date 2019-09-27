# SwiftThreeStudy


#### 创建model对象

```
class BaseModel: NSObject {
    var iconImage: String
    var name: String
    var content: String
    var modelArray:[models] = []
    
    init(iconImage: String, name: String, content: String, array: Array<models>) {
        self.iconImage = iconImage
        self.name = name
        self.content = content
        self.modelArray = array
    }
    
}
class models: NSObject {
    var icon: String
    var name: String
    
    init(icon: String, name: String) {
        self.icon = icon
        self.name = name
    }
    
}
```

#### 创建不同的cell
```
<!--个人信息cell-->

 var nameLabel = UILabel()
    var iconImageView = UIImageView()
    var contentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        iconImageView = UIImageView.init(frame: CGRect(x: 20, y: 0, width: 100, height: 100))
        nameLabel = UILabel.init(frame: CGRect(x: 140, y: 20, width: 100, height: 20))
        contentLabel = UILabel.init(frame: CGRect(x: 140, y: 50, width: 200, height: 20))
        contentView.addSubview(nameLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(contentLabel)
    }
    func updateCurrentUI(model:BaseModel) -> Void {
        iconImageView.image = UIImage.init(named: model.iconImage)
        nameLabel.text = model.name
        contentLabel.text = model.content
    }
    
<!--内容展示cell-->

 var iconImageView = UIImageView()
    var nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        self.setCurrentUI()
    }
    <!--有icon-->
    func updateCurrentUI(model:models) -> Void {
        iconImageView.image = UIImage.init(named: model.icon)
        nameLabel.text = model.name
        nameLabel.textColor = UIColor.black
    }
    <!--无icon-->
    func updateCurrentUIWithNoIcon(name: String) -> Void {
        nameLabel.text = name
        nameLabel.textColor = UIColor.blue
    }
    
    func setCurrentUI() -> Void {
        iconImageView = UIImageView.init(frame: CGRect(x: 20, y: 10, width: 40, height: 40))
        nameLabel = UILabel.init(frame: CGRect(x: 80, y: 20, width: 200, height: 20))
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
    }
    
登出cell

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel = UILabel.init(frame: CGRect(x: UIScreen.main.bounds.size.width / 2.0 - 100, y: 20, width: 200, height: 20))
        nameLabel.textColor = UIColor.red
        nameLabel.text = "Log Out"
        nameLabel.textAlignment = NSTextAlignment.center
        contentView.addSubview(nameLabel)
    }
    
```

#### TableView显示

```
<!--申明全局变量、常量-->
    var tableView = UITableView()
    let identifier = "identifier"
    let identifierOwn = "identifierOwn"
    let identifierLog = "identifierLog"
    
    var baseModel = BaseModel(iconImage: "", name: "", content: "", array: [])
    var modelArray:[models] = []
    
    var socialModelArray:[models] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCurrentModel()
        self.setTableViewUI()
        
        // Do any additional setup after loading the view.
    }
 <!--赋值数据model-->
    func setCurrentModel() -> Void {
        modelArray = [models(icon: "calculator", name: "jisuanqi"),
                      models(icon: "check", name: "check"),
                      models(icon: "image", name: "image"),
                      models(icon: "info", name: "info"),
                      models(icon: "setting", name: "setting")
        ]
        baseModel = BaseModel(iconImage: "user", name: "乐乐", content: "update your profile", array:modelArray)
        
        socialModelArray = [models (icon: "github", name: "github"),
                            models (icon: "twitter", name: "twitter"),
                            models (icon: "wechat", name: "wechat")]
    }
    
<!--创建tableview-->
    func setTableViewUI() -> Void {
        tableView = UITableView.init(frame: view.bounds, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.init(displayP3Red: 239 / 255.0, green: 239 / 255.0, blue: 244 / 255.0, alpha: 1)
        tableView.register(BaseTableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
        tableView.register(BaseOwnTableViewCell.classForCoder(), forCellReuseIdentifier: identifierOwn)
        tableView.register(BaseLogTableViewCell.classForCoder(), forCellReuseIdentifier: identifierLog)
        self.view.addSubview(tableView)
    }
<!--delegate、datesource-->

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }else{
            return 60
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1{
            return modelArray.count + 1
        }else if section == 3 {
            return socialModelArray.count
        }else{
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:BaseOwnTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifierOwn) as! BaseOwnTableViewCell
            cell.updateCurrentUI(model: baseModel)
            return cell
        }else if indexPath.section == 1 || indexPath.section == 2 {
            let cell:BaseTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier) as! BaseTableViewCell
            if indexPath.section == 1 {
                if indexPath.row == modelArray.count{
                   cell.updateCurrentUIWithNoIcon(name: "See More")
                }else{
                    cell.updateCurrentUI(model: modelArray[indexPath.row])
                }
            }else{
                cell.updateCurrentUIWithNoIcon(name: "Add Favorites")
            }
            return cell
        }else if indexPath.section == 3 {
            let cell:BaseTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier) as! BaseTableViewCell
            cell.updateCurrentUI(model: socialModelArray[indexPath.row])
            return cell
        }else if indexPath.section == 4 {
            let cell:BaseLogTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifierLog) as! BaseLogTableViewCell
            return cell
        }
        return UITableViewCell.init()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("CurrentSection\(indexPath.section),CurrentRow\(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2 {
            let titleLabel = UILabel.init(frame: CGRect(x: 20, y: 0, width: 100, height: 40))
            titleLabel.text = "Favorites"
            let view = UIView.init()
            view.addSubview(titleLabel)
            return view
        }else{
            return UIView.init()
        }
    }
```

直通车： https://github.com/princeSmall/Swift_Practice_Three