# TIL
Today I learned...
### 2023.06.20
### resumable protol
1. 클라이언트는 멈췄던 다운로드를 복구하기 위해 서버로 GET 요청을 보냄
2. 아래 내용과 함께 서버에서 응답이 옴
    1. ETag
    2. Accept-Ranges
        1. resumable downloads를 지원한다는 뜻
        2. bytes는 서버가 이 리소스의 특정 바이트에 대한 범위 요청을 지원한다는 것을 의미 (남은 바이트만큼도 보낸다는 걸 의미한다는 건가?)
    3. Content-Length
3. 이 다운로드 조차 방해를 받아서 끝부분을 받지 못했다면?
4. 클라이언트는 서버에 다운로드 받지 못한 범위를 알림
    1. 다운로드가 중도에 방해 받았네? 방해로 인해 못 받은 부분만 다운로드 받으면 됨!
    2. 근데 나머지 데이터가 기존에 받아둔 데이터와 다르다는 보장이 없음! → 이때 ETag를 사용
        1. If-Range가 이전 응답에 받았던 ETag를 포함한다면 서버에게 남은 데이터만 달라고 함
    3. 만약 ETag가 같다면 서버는 206응답을 보냄
        1. Content-Range는 이번 응답에 포함된 바이트의 범위를 나타냄
```swift
let downloadTask = session.downloadTask(with: request)
downloadTask.resume()

gurad let resumeData = await downloadTask.cancleByProducingResumeData() else {
        //Download cannot be resumed
        return 
}

let newDownloadTask = session.downloadTask(withResumeData: resumeData)
newDownloadTask.resume()
```
---
### 2023.06.19
### SwiftNIO

- Apple이 개발한 Swift용 이벤트 기반 비동기 네트워크 애플리케이션 프레임워크
- TCP, UDP, DNS, HTTP, WebSockets 등 다양한 네트워크 프로토콜을 지원
- Apple Open Source 프로젝트의 일부
- SwiftNIO 기능
    - 이벤트 기반 비동기 네트워킹
    - TCP, UDP, DNS, HTTP, WebSockets 등 다양한 네트워크 프로토콜 지원
    - 고성능과 확장성
    - Swift로 작성된 간결하고 사용하기 쉬운 API
    - SwiftNIO는 고성능 네트워크 애플리케이션을 개발하려는 개발자에게 유용한 도구입니다.
---
### 2023.06.16
### rangeOfCharacter
```swift
var name = "Hello+Zooey"

if let range = name.rangeOfCharacter(from: .symbols) {
    print(name[range]) // +
}
```
---
### 2023.06.15
### split
```swift
var str = "Hello Swift"
var array = str.split(separator: " ")
print(array) // ["Hello", "Swift"]
print(array.joined()) // HelloSwift
```
### 2023.06.14
### components
```swift
var name = " Z o o e y "
var removeName = name.components(separatedBy: " ")
print(removeName) // ["", "Z", "o", "o", "e", "y", ""]
```
---
### 2023.06.13
### Closure
- 이름이 없는 익명의 함수 (이름 없이도 호출이 가능)
- 1급 객체
    - 클로저는 변수에 할당 할 수 있음
    - 클로저는 파라미터로 전달할 수 있음 (인풋)
    - 클로저는 함수의 반환형이 될 수 있음 (아웃풋)
---
### 2023.06.12
### URLSession
- swift에서 네트워크 데이터 전송을 위한 클래스
- 네트워크 작업을 비동기적으로 처리하며, 백그라운드에서 데이터 다운로드, 업로드 및 전송 상태를 모니터링 할 수 있음
- URLSession 클래스는 싱글톤으로 만들어져 있으며, custom 세션만큼 자세한 설정을 할 수는 없지만, 초기 시작으로는 적합함. shared로 접근할 수 있으면 3가지의 세션이 있음
    1. default session
    2. ephemeral session
    3. background session
---
### 2023.06.11
### prepareForReuse
- `UITableViewCell`과 `UICollectionViewCell`의 인스턴스 메서드
- `UITableViewCell`과 `UICollectionViewCell`은 셀을 재사용하는데, 해당 셀이 재사용되기 전에 이 메서드가 호출됨
- `prepareForReuse`에서는 content 관련되지 않은 것들 (예를 들어 셀의 알파값, 선택 상태 등)을 초기화 해야 함 (성능 이슈를 피하기 위해)
- 셀을 재사용할 때, content에 대한 초기화는 `tableView(_:cellForRowAt:)`에서 해주면 됨
- 오버라이드 해서 사용할 때는 반드시 슈퍼 클래스를 호출해야 함

```swift
override func prepareForReuse() {
   super.prepareForReuse()
}
```
- deque → prepareForReuse → return cell 순서로 불리게 됨
---
### 2023.06.08
### 다크모드 설정 방법
- iOS13부터 다크모드가 생겨 다크모드 여부에 따라 앱을 다르게 대응할 수 있음
1. 다크모드 설정하기 
    1. Color Assets - Appearance - 다크모드용 Color Set을 설정하는 방법
2. 다크 모드 제한하기
    1. info.plist를 통해 아예 라이트 모드 only나 다크 모드 only로 설정할 수 있음
    
    ```sql
    <key>UIUserInterfaceStyle</key>
    <string>Dark</string>
    ```
---
### 2023.06.07
### App의 inActive 상태
- iOS 앱은 active, inActive, Background, Suspended 등의 앱 상태를 가질 수 있음
- 앱이 Inactive 상태가 되는 경우
    - 앱에서 다른 앱으로 전환하는 경우
    - 전화가 오는 경우
    - 알림창이 떠서 사용자의 반응을 기다리는 경우
    - 화면 회전 중인 경우
    - 앱이 일시적으로 중단되는 경우 등
- 앱이 실행 중이며 여전히 메모리에 로드되어 있지만, 사용자 인터랙션이나 다른 이벤트를 기다리고 있는 상태. 앱이 Inactive 상태에 진입하면 `applicationWillResignActive(:)` 메서드가 호출되며, 다시 Active 상태가 되면 `applicationWillEnterForeground(:)` 메서드가 호출됨
- 따라서 Inactive 상태에서는 앱의 상태가 일시적으로 중단된 것으로 생각할 수 있음
---
### 2023.06.06
### TableView를 동작 방식과 화면에 Cell을 출력하기 위해 최소한 구현해야 하는 DataSource 메서드를 설명하시오.
1. 뷰가 로드되면 UITableView 객체가 생성됩니다.
2. UITableViewDataSource 프로토콜을 구현한 객체가 UITableView에 데이터를 제공합니다. 이때 데이터는 섹션과 로우로 구성된 2차원 배열 형태로 제공됩니다.
    1. ****`tableView(_:numberOfRowsInSection:)`****
    2. ****`tableView(_:cellForRowAt:)`****
3. UITableViewDelegate 프로토콜을 구현한 객체가 UITableView의 뷰의 모양과 동작을 결정합니다. 이때 섹션의 높이, 로우의 높이, 셀의 선택 가능 여부, 셀의 스와이프 가능 여부 등을 설정할 수 있습니다.
4. UITableView는 UITableViewDataSource 프로토콜을 구현한 객체로부터 제공받은 데이터를 바탕으로 각각의 로우를 UITableViewCell 객체로 생성합니다.
5. UITableViewCell 객체는 UITableView에 삽입되어 화면에 표시됩니다. 이때 UITableView는 스크롤링이 가능하도록 화면을 자르고, 스크롤링할 때마다 새로운 UITableViewCell 객체를 생성하거나 기존의 객체를 재활용하여 효율적으로 메모리를 관리합니다.
6. 사용자가 UITableView에서 로우를 선택하면 UITableViewDelegate 프로토콜을 구현한 객체에게 선택된 로우의 정보를 전달합니다.
7. UITableViewDelegate 프로토콜을 구현한 객체는 선택된 로우에 대한 처리를 수행합니다.
---
### 2023.06.04
### TableView를 동작 방식과 화면에 Cell을 출력하기 위해 최소한 구현해야 하는 DataSource 메서드를 설명하시오.
1. 뷰가 로드되면 UITableView 객체가 생성됩니다.
2. UITableViewDataSource 프로토콜을 구현한 객체가 UITableView에 데이터를 제공합니다. 이때 데이터는 섹션과 로우로 구성된 2차원 배열 형태로 제공됩니다.
    1. `tableView(_:numberOfRowsInSection:)`
    2. `tableView(_:cellForRowAt:)`
3. UITableViewDelegate 프로토콜을 구현한 객체가 UITableView의 뷰의 모양과 동작을 결정합니다. 이때 섹션의 높이, 로우의 높이, 셀의 선택 가능 여부, 셀의 스와이프 가능 여부 등을 설정할 수 있습니다.
4. UITableView는 UITableViewDataSource 프로토콜을 구현한 객체로부터 제공받은 데이터를 바탕으로 각각의 로우를 UITableViewCell 객체로 생성합니다.
5. UITableViewCell 객체는 UITableView에 삽입되어 화면에 표시됩니다. 이때 UITableView는 스크롤링이 가능하도록 화면을 자르고, 스크롤링할 때마다 새로운 UITableViewCell 객체를 생성하거나 기존의 객체를 재활용하여 효율적으로 메모리를 관리합니다.
6. 사용자가 UITableView에서 로우를 선택하면 UITableViewDelegate 프로토콜을 구현한 객체에게 선택된 로우의 정보를 전달합니다.
7. UITableViewDelegate 프로토콜을 구현한 객체는 선택된 로우에 대한 처리를 수행합니다.
---
### 2023.06.01
### UINavigationController 의 역할이 무엇인지 설명하시오.
- 스택에 하나 이상의 차일드 뷰를 관리하는 컨테이너뷰 컨트롤러
- 뷰컨에서 하나의 아이템을 선택하면 (이전 뷰컨트롤러는 숨기면서 )새로운 뷰컨으로 넘어가고 백버튼을 누르면 나왔던 뷰컨트롤러는 사라지는 (다시 아래로 숨겨짐) 작동 방식을 가짐
- 배열의 가장 첫 번째 뷰컨트롤러를 루트뷰컨트롤러라고 하며, 스택에 가장 아래에 있음
- 배열의 마지막 뷰컨트롤러는 스택에 맨 위에 있고, 현재 보여지고 있는 뷰컨트롤러임
- 네비게이션 컨트롤러는 인터페이스 top에 네비게이션바를, bottom에 툴바를 관리함.
---
### 2023.05.31
### DFS vs BFS
- DFS(Depth-First Search)는 그래프에서 깊이 우선으로 탐색하는 알고리즘입니다. 루트 노드에서 시작하여 다음 분기로 넘어가기 전에 해당 분기를 완벽하게 탐색합니다. BFS(Breadth-First Search)는 그래프에서 너비 우선으로 탐색하는 알고리즘입니다. 루트 노드에서 시작하여 인접한 노드를 모두 탐색한 후, 그 다음 인접한 노드를 탐색하는 방식으로 탐색합니다.
- DFS는 BFS보다 깊은 곳까지 탐색할 수 있지만, BFS보다 탐색 시간이 오래 걸립니다. BFS는 DFS보다 탐색 시간이 빠르지만, 깊은 곳까지 탐색할 수 없습니다.
---
DFS와 BFS는 그래프 탐색에 많이 사용되는 알고리즘입니다. DFS는 최단 경로를 찾거나, 그래프의 모든 노드를 탐색하는 데 사용됩니다. BFS는 그래프의 모든 노드를 탐색하거나, 특정 노드에 도달하는 데 사용됩니다.
### 2023.05.30
### UIView 객체의 역할
- 앱의 UI와 View의 이벤트를 처리하는 객체에 대한 배경
- 앱은 (보통) 하나의 Window만 갖게 됨.
- Window의 RootViewController를 관리하고, 앱의 다양한 ViewController들을 관리
---
### 2023.05.25
### UIView 에서 Layer 객체는 무엇이고 어떤 역할을 담당하는지 설명하시오.
- UIView에서 CALayer의 객체를 layer라고 함
- CALayer 시각적인 요소를 표현하는 객체이며
- 뷰의 배경색, 경계션, 코너 라운딩과 같은 속성을 제어하며, 뷰의 애니메이션도 생성할 수 있음
### 2023.05.24
### 순수함수
- 순수 함수(pure function)는 동일한 인자에 대해 항상 동일한 결과를 반환하며, 함수 외부의 상태를 변경하지 않습니다. 즉, 부수 효과(side effect)가 없는 함수입니다. 함수 내에서 입출력 외에 다른 상태를 변경하지 않는다면, 함수를 순수 함수로 만들 수 있습니다.
- 특징
    - 입력값이 같으면 항상 같은 결과를 반환합니다.
    - 함수 외부의 상태를 변경하지 않습니다.
    - 부작용이 없기 때문에 함수 호출 순서를 바꾸더라도 결과가 바뀌지 않습니다.
    - 함수를 병렬화하거나 캐싱하는 등의 최적화 기법을 적용할 수 있습니다.
- 순수 함수는 함수형 프로그래밍에서 중요한 개념 중 하나입니다. 순수 함수를 사용하면 코드의 테스트와 유지 보수가 쉬워지며, 코드의 안정성과 가독성이 향상됩니다. 또한, 순수 함수를 이용하면 코드의 재사용성이 높아지고, 병렬처리에 대한 문제를 해결할 수 있습니다.
---
### 2023.05.23
### UICollectioinViewDiffableDataSource
1. UICollectioView와 UICollectionViewDiffableDataSource선언
- 제일 중요!! Section과 Category는 Hashable 해야 함!!!
```swift
    private var filterCollectionView: UICollectionView!
    private var collectionViewDataSource: UICollectionViewDiffableDataSource<Section, Category>!
```

2. DiffableDataSource 셋팅
```swift
        collectionViewDataSource = UICollectionViewDiffableDataSource<Section, Category>(collectionView: filterCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = self.filterCollectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as! FilterCollectionViewCell
            cell.label.text = itemIdentifier.headerTitle
            cell.layer.borderWidth = 1
            cell.sizeThatFits(CGSize(width: 60, height: 40))
            return cell
        })
        filterCollectionView.dataSource = collectionViewDataSource
```
3. snapShot에 Section과 Item 더해주기
```swift
            var snapShot = NSDiffableDataSourceSnapshot<Section, Category>()
        snapShot.appendSections([.main])
        snapShot.appendItems([
            Category(headerTitle: "방 종류", category: ["원룸", "투쓰리룸", "아파트", "오피스텔"]),
            Category(headerTitle: "매물 종류", category: ["월세", "전세", "매매"]),
            Category(headerTitle: "가격", category: ["오름차순", "내림차순"]),
        ])
        self.collectionViewDataSource.apply(snapShot)
        
        // Display the data in the UI.
        filterCollectionView.reloadData()
```
---
### 2023.05.22
### Mock Data 만들어서 사용하기
```swift
guard let path = Bundle.main.path(forResource: "Mock", ofType: "json") else {
    return
}
guard let jsonString = try? String(contentsOfFile: path) else {
    return
}
let decoder = JSONDecoder()
let data = jsonString.data(using: .utf8)
guard let safeData = data else { return }

let result = try? decoder.decode(RoomModel.self, from: safeData)

```
### 2023.05.18
### ARC (Automatic Reference Counting)
- ARC 이전에는 MRC(Manual Reference Counting)라고 해서 메모리 관리를 수동으로 해야했기 때문에 메모리 관리가 쉽지 않았음
- ARC부터는 자동으로 메모리 할당과 해제를 해줌
- 인스턴스를 가르키는 소유자 갯수를 카운팅하며, 카운팅이 1개라도 있는 경우에는 메모리에서 유지되고, 소유자가 없는 경우 메모리에서 해제됨
- ARC를 통해 메모리 관리가 가능하지만, 강한 참조 사이클과 같은 메모리 누수 현상이 있을 수 있기 때문에 개발자도 관리 기법을 잘 알고 대처해야 함
---
### 2023.05.17
### Stack
- 후입선출 (늦게 들어간 데이터가 가장 먼저 나옴)
- 스택 메모리 변수의 특성은 스코프를 벗어나면 스택 메모리에서 사라짐
- 힙에 생성된 값은 개발자가 직접 제거해야하지만(= 지우기 전까지는 메모리가 유지됨), 스택에서는 자동으로 지어짐
- 원시타입의 데이터가 스택에 할당됨 (자바)
- 각 스레드당 하나의 스택만 존재
---
### 2023.05.16
### 클로저와 함수의 관계
- 클로저는 함수의 특별한 형태. 함수가 클로저를 포함하는 관계 (클로저는 함수 중 이름 없는 익명 함수)
- 클로저는 이름이 없을 뿐 함수와 마참가지로 입력값을 받고 출력값을 반환할 수 있음. 다른 함수 내에서도 선언이 가능하고 변수나 상수에도 할당이 가능
- 클로저는 주변 환경에서 선언된 변수나 상수를 캡처할 수 있기 때문에 함수 외부의 값을 가져와서 내부에서 사용할 수 있음
---
### 2023.05.15
### Closure
- 이름이 없는 익명의 함수 (이름 없이도 호출이 가능)
- 1급 객체
    - 클로저는 변수에 할당 할 수 있음
    - 클로저는 파라미터로 전달할 수 있음 (인풋)
    - 클로저는 함수의 반환형이 될 수 있음 (아웃풋)
---
### 2023.05.10
### Codable
- Encodable과 Decodable protocol에 대한 type alias

```swift
typealias Codable = Decodable & Encodable
```

- Encodable은 인코딩을 위한 프로토콜, Decodable은 디코딩을 위한 프로토콜로 두 프로토콜을 합쳐놓은 codable을 채택할 시, 인코딩과 디코팅 모두 처리 가능
- codable을 채택한 타입은 JSON, Property List, XML 등 다양한 형식으로 인코딩과 디코딩이 가능
- 인코딩 또는 디코딩을 위해 JSONEncoder() 또는 JSONDecoder()을 이용
- 클래스, 구조체, 열거형에서 모두 채택 가능
---
### 2023.05.09
### Result type
- 함수나 메서드의 실행 결과를 성공(Success) 또는 실패(Failure) 케이스로 나타내는 열거형
- 비동기 작업은 일반적으로 결과가 즉시 반환되지 않기 때문에 Result type을 사용해 결과가 성공했는지 실패했는지 나타낼 수 있음
- 리턴 타입이 성공/실패의 결과를 모두 담을 수 있고, 기존 처리 문법(do-catch)의 번거로움(throw 키워드, 호출 시 try키워드 등)을 줄여줌
- 기존 에러 처리의 대안이 아닌 개발자가 취할 수 있는 선택지 중 하나
---
### 2023.05.04
### Generic
- 단순히 인풋 타입만 다르고, 구현 내용이 동일할 때 사용 (매번 작성하는 수고스러움을 덜어줌)
- 코드의 재사용성을 높이고 타입 안정성을 유지하는 방법
- 일반적으로 타입을 의미하는 <T>로 기재하며, 파라미터의 타입이나 리턴형으로도 사용.
- 함수와 메서드를 작성할 때, 해당 함수 또는 메서드의 파라미터 또는 반환값의 타입을 명시하지 않고, 제네릭한 타입 매개변수를 사용하여 작성할 수 있음
- 실제 함수 호출 시에 원하는 타입으로 치환하면 됨
---
### 2023.05.03
### property wrapper
- swift 5.1 ~
- 코드를 간결하게 작성하고, 반복을 줄이며, 변수나 상수에 대한 특별한 동작을 캡슐화하는데 사용
- @ 기호와 함께 사용됨
---
### 2023.05.02
### defer가 호출되는 순서는 어떻게 되고, defer가 호출되지 않는 경우를 설명하시오.
- defer는 등록한 순서와 역순으로 실행이 됨
1. 호출되지 않을 때 (if문의 return 등의 키워드로 인해 함수 자체가 종료되어버리면 defer문 호출 안됨)
2. defer 문에서 호출하는 함수가 오류를 발생시키는 경우
    - defer문 내에 함수가 오류를 발생시키지 않도록 주의 해야 함
---
### 2023.05.01
### defer란 무엇인지 설명하시오.
- 특정 블록 내에서 코드 실행이 종료되기 직전에 항상 실행되도록 보장하는 방법 (= 코드 실행을 스코프 종료 시점으로 연기시는 방법)
- 코드에서 리소스를 할당하거나 열린 파일을 닫는 등의 정리 작업을 수행할 때 유용
- 한 번은 호출이 되어야 실행이 됨
- 사용 이유 : 비대해지는 함수 실행 중 특정 기능의 수행을 잊지 않고 하기 위해
- defer 문이 여러 개일 때는 등록한 역순으로 실행되기 때문에 일반적으로 하나의 defer문만 사용하는 것이 좋음
---
### 2023.04.27
### 접근제어자
- 접근의 정도를 지정하여 코드의 세부 구현 내용을 숨길 수 있게 하는 것
- 숨기고 싶은 코드를 숨길 수 있고, 컴파일 시간도 줄어듦
- 접근 제어가 가능한 요소 : 타입 자체, 변수, 프로퍼티, 함수, 메서드, 프로토콜 등
- `open` : 클래스의 최대치 접근
    - 다른 모듈에서 접근 가능 + 상속 및 재정의 가능
- `public` : 구조체의 최대치 접근
    - 다른 모듈에서 접근 가능 + 상속 및 재정의 불가능
- `internal` : 디폴트 값
    - 같은 모듈 내에서만 접근 가능
- `fileprivate` :
    - 같은 파일 내에서만 접근가능
- `private` : 가장 강력한 접근 제어
    - 가능 scope 내에서만 접근 가능
---
### 2023.04.26
### combine으로 URLSession
```swift
    func getData() -> AnyPublisher<[FollowModel], Error> {
        let url = URL(string: "https://api.github.com/users")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                return data
            }
            .decode(type: [FollowModel].self, decoder: JSONDecoder())
            .map({ data in
                print(data)
                return data
            })
            .eraseToAnyPublisher()
    }
```
- Model
```swift
struct FollowModel: Codable {
    let login: String?
    let avatarURL: String?
    let followersURL: String?
    let followingURL: String?

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
    }
}
```
---
### 2023.04.25
### Extension 내부에서 함수를 override할 수 있는지 설명하시오.
- 불가능
- Extension은 특정 타입에 기능을 추가하여 사용하는 목적이기 때문에 override(재정의)를 원한다면 해당 클래스를 상속해서 재정의 해야 함
---
### 2023.04.24
### Extension
- 현존하는 타입에 기능을 추가하여 사용할 수 있게 하는 기능
- 클래스, 구조체, 열거형 모두에서 가장
- 기존의 타입에 내가 원하는 기능을 더하여 더욱 활용성 높게 사용 가능
- 확장이 불가능한 부분 : 저장속성
- 그 외 (타입) 계산 속성, (인스턴스) 계산 속성, (타입)메서드, (인스턴스) 메서드, 생성자, 서브스크립트, 프로토콜 등은 전부 확장 가능
---
### 2023.04.21
### escaping closure
- 함수의 파라미터로 클로저를 사용할 경우, 함수의 종료와 함께 클로저도 종료됨
- 그러나 @escaping 클로저의 경우 함수의 실행 흐름을 벗어나 힙 영역에 저장되어 함수가 종료되도 자신만의 실행 흐름을 따름
(일반 함수는 스택 영역에 저장되고, 종료 시 스택에서 제거됨)
1. 어떤 함수의 내부에 존재하는 클로저(파라미터가 클로저임)를 외부 변수에 저장하는 경우
2. GCD 비동기 코드의 경우
---
### 2023.04.20
### mutating 키워드에 대해 설명하시오.
- 값 타입(구조체, 열거형)에서는 인스턴스 메서드 내에서 속성(property) 수정 불가능
- 수정을 원한다면 인스턴스 메서드 앞에 mutating 키워드를 붙여야 함
```swift
struct A {
        var name: String
        
        mutating func changeName(new: String) { 
                self.name = new
        }
}
```
---
### 2023.04.19
### Hashable이 무엇이고, Equatable을 왜 상속해야 하는지 설명하시오.
- Hasable
    - 정수를 해시값(어떤 데이터를 64비트 정수로 치환하여 만든 숫자)으로 생성하기 위해 해시될 수 있는 프로토콜
    - 이 프로토콜 채택 시, 정수를 유일한 값(해시값)으로 구별할 수 있게 됨
    - 중복을 인정하지 않는 Set과 Dictionary를 검색할 때, 이 hasable 프로토콜이 이용됨
    - 스위프트의 기본 타입은 Int, String, Double 등의 타입에는 기본으로 구현되어 있으며, 커스텀 타입에는 직접 구현해야 함
- Equtable
    - 값의 비교를 가능하게 해주는 프로토콜
    - `==` 또는 `≠`를 사용하여 값의 비교가 가능
- 두 객체의 Hash 값이 같다고 해서 두 객체가 같은 객체라는 걸 보장해주지 않음 → Equtable 프로토콜을 구현하여 두 객체의 동일성 여부를 구별해야만 유일 무의한 해시값이 보장되기 때문에 Hashable은 Equatable 프로토콜을 채택해야만 Hashable의 의미가 성립함
---
### 2023.04.18
### Protocol Oriented Programming과 Object Oriented Programming의 차이점을 설명하시오.
- OOP(Object Oriented Programming)
    - 사물을 객체로 형성하여 공통점을 갖는 모든 곳에서 상속받는 개체 내부의 모든 로직을 캡슐화. 의도 하지 않아도 상속했다는 이유로 모든 속성과 행위를 공유해야하며, 복잡한 상속 구조를 지닌 클래스를 상속했다면 원하는 클래스를 참조해야 할 때 다운 캐스팅을 해야 함. 또한 단 하나의 Super Class만 상속이 가능.
- POP(Protocol Oriented Programming)
    - 필요한 부분만 프로토콜로 분리해서 만들 수 있으며, 다중 프로토콜 구현 가능. 상속이 되지 않는 구조체의 경우에도 프로토콜을 이용해 공통 기능을 구현할 수 있음. 또한 확장을 통해 기능만 분리할 수도 있음.
---
### 2023.04.14
### protocol
- 특정 작업(task)이나 기능에 적합한 메서드, 속성(property), 기타 요구사항의 청사진
- 클래스, 구조체, 열거형에서 채택이 가능하며(= 값타입, 참조 타입 구분 없이 사용 가능), 프로토콜을 채택한 타입에서는 해당 요구사항을 구현해야 함
- 프로토콜의 요구사항으로는 속성, 메서드가 가능
- 프로토콜은 상속이 가능하며(다중상속도 가능), 확장을 통해 구체적인 정의도 가능
---
### 2023.04.13
### MVVM
- Model - ViewModel - View의 구조를 갖는 디자인 패턴

| View | 앱의 UI. ViewModel로 받은 데이터를 유저에게 보여주는 역할
ViewModel에만 접근이 가능하며, 이벤트 발생 시 ViewModel에게 알림 |
| --- | --- |
| ViewModel | 비즈니스 로직 담당. View의 요청에 따라 로직을 실행하고, Model의 변화에 따라 View를 refresh하는 등의 역할
Model과 View의 중재자.  |
| Model | 데이터와 그 로직을 관리 (데이터 구조체, 네트워크 조직, JSON 파싱 코드 등) |
- MVC에서 ViewController가 너무 커지는 문제를 ViewModel로 해결하고자 함
- Model에서 가져온 데이터를 ViewModel에서 처리함으로써 Controller가 커지는 걸 방지 + ViewModel과 View를 데이터 바인딩을 통해 연결하여 ViewModel이 준 데이터로 View를 업데이트 함
- Model의 데이터를 ViewModel에 전달 → ViewModel는 바인딩되어 있는 View를 업데이트
View에 들어온 이벤트를 ViewModel에게 전달 → Model 업데이트
---
### 2023.04.11
### MVC Pattern
- View에서 유저의 인터랙션(예를 들어 터치)이 발생 → View는 Controller에게 알림 → Controller는 이벤트(터치)를 해석하고 Model에게 data 요청 → Model은 요청받은 data를 Controller에게 응답 → Controller를 Model에게 받은 응답 데이터를 해석하여 View에 전달
- 장점 : 간단하게 구조 파악이 가능하며 사용이 용이
- 단점 : View와 Controller의 역할의 완전한 분리가 불가능 (controller가 view를 소유하여 UIViewController 역할을 함)
---
### 2023.04.06
### Delegates와 Notification 방식의 차이점에 대해 설명하시오.
- Delegate
    - 객체 간 1:1 통신을 위해 사용됨. 객체 A가 객체 B의 Delegate로 지정되면 A는 B의 특정 이벤트나 상황에 대한 응답을 처리
    - Delegate는 해당 프로토콜에 정의된 요구사항을 반드시 구현해야 함
    - 두 객체는 protocol로 연결된 직접적인 결함임
    - 해당 protocol에 구현된 내용을 보고 어떤 요구사항이
    - 단점
        - 메모리 누수 : Delgate 객체가 dealoc 되지 않은 경우 메모리 누수가 발생할 수 있으므로, deleagate의 객체를 weak으로 선언하는 것이 좋음
        - 코드 유지 보수 : delegate를 구현하는 객체나 사용하는 개체가 변경되는 과
- Notification
    - 1:N 관계의 통신을 위해 사용
    - 객체 A는 Notification을 post하고, 다른 객체들(B, C, D 등)이 Notification을 observe하여 받게 됨
    - post를 하는 주체와 observe를 하는 객체들 간의 느슨한 결합 관계를 유지
    - 단점
        - 디버깅의 어려움 : 어떤 객체가 observe하는지 어떤 이벤트가 발생했는지 추적 어려움
        - 오버헤드 : Notification을 지속적으로 post하고, observe하는 경우 시스템 자원 소비량이 증가
        - 의존성 : Notification을 observe하는 객체와 post하는 객체 간의 의존성이 생기지 않도록 유의해야 함
---
### 2023.04.05
### Singleton 패턴을 활용하는 경우를 예를 들어 설명하시오.
- 한 개의 클래스로 만든 객체는 단 한개여야만 한다는 규칙을 가진 디자인 패턴
- 단 한개의 객체만 생성하여 이 객체로만 접근이 가능하도록 함
- 일반적으로 `static let`으로 선언하며, 다른 곳에서의 객체 생성을 막기 위해 `private`로 제한된 생성자를 사용
- 장점 : 하나의 객체를 사용하기 때문에 메모리 사용이 줄어들고, 접근 시간 빠름
- 단점 : 테스트가 쉽지 않고, 장점으로 인해 사용처가 많아지면 관리가 쉽지 않음
- 예시 : `UserDefaults` , `URLSession`
- 예를들어 network 작업에 사용되는 `URLSession`의 경우, 싱글톤으로 구현되어 있으며 별도의 객체 생성 없이도 `URLSession.shared`라는 키워드로 어디서든 접근이 가능함
---
### 2023.04.04
### Delegate 패턴을 활용하는  경우를 예를 들어 설명하시오.
- 프로토콜을 이용한 디자인 패턴 중 하나
- 프로토콜에 요구된 사항들을 대리자(delegate)가 되어 전달하면 수신자가(receiver) 수행하게 됨
- `UITableViewDelegate`, `UICollectionViewDelegate` 등이 빈번하게 사용하는 delegate의 사례임
    - 특정 `ViewController`가 스스로를 위임자(delegate)로 선언 후 `UITableViewDelegate Protocol`을 채택하면, 해당 delegate에서 선언된 필수 메서드들을 구현해야 함
---
### 2023.04.03
- 타입 자체에 속한 메서드
- 타입 자체가 가져야 하는 공통된 기능이 있을 때 사용
- static 메서드의 경우 상속 시, 재정의가 불가능 → 재정의 하기 위해서는 `static` → `class`로 바꿔야함
- 인스턴스 메서드는 `인스턴스.메서드이름()`으로 접근하지만, 타입 메서드는 `타입.메서드이름()`으로 접근
    
    ```swift
    class Dog { 
        func 인스턴스메서드() { }
        static func 타입메서드() { }
    }
    
    let dog = Dog()
    dog.인스턴스메서드()
    
    Dog.타입메서드()
    ```
    
- 예를 들어, `Int.random(in: 1...3)` 은 Int 타입 안에 구현된 타입 메서드임
---
### 2023.03.29
### String은 왜 subscript로 접근이 안되는지 설명하시오.
- String은 Character의 컬렉션으로 구성됨 → 각 Character는 **하나 이상**의 유니코드 스칼라 값으로 구성될 수 있음 → 각 문자가 일정한 크기를 가지지 않을 수 있기 때문에 각 문자에 인덱스를 통해 직접 접근하는 것이 불가능
- 대신 `count`, `startIndex`, `endIndex` 등의 메서드를 통해 인덱스과 관련된 값을 얻을 수 있음
---
### 2023.03.28
### Subscripts
- 콜렉션, 리스트, 시퀀스 등의 집합의 특정 멤버에 간단하게 접근할 수 있게 해주는 메서드
- 대괄호에 인덱스 값을 전달하여 멤버에 접근
- 클래스, 구조체, 열거형 등에서도 스크립트를 정의해 사용할 수 있음
---
### 2023.03.27 
### Optional
- 값이 있을 수도, 없을 수도 있는 변수/상수를 나타내는 타입
- 옵셔널 타입이 일반 타입보다 더 넓은 개념 → 일반 타입을 옵셔널에 넣을 수 있지만, 옵셔널을 일반 타입에 넣을 수는 없음
- 옵셔널 값을 추출하는 방법에는 4가지가 있음
    - 강제 추출 : 강제로 값을 추출
    - 옵셔널 바인딩 (if let, guard let) : 값이 있다면 새로운 변수/상수에 값을 넣는다는 뜻 (값이 nil이면 if/gurd문이 실행되지 않음)
    - nil-coalescing : 옵셔널일 경우을 대비해 기본값을 설정하는 것
---
### 2023.03.26
### AnyObject
    - class만 채택할 수 있는 프로토콜
    - Any 타입이 모든 타입의 객체를 담을 수 있다면, AnyObject는 클래스 타입만 담을 수 있음.
---
### 2023.03.23
- Activity Indicator를 true로 주면 버튼에 indicator가 생성됨
```swift
    let button = UIButton(type: .system)
    button.configuration = .filled
    button.configuration?.showsActivityIndicator = true
```
---
### 2023.03.21
### Convenience init
- class에만 있는 생성자
- 모든 속성을 초기화 해야하는 지정 생성자와 다르게 모든 속성의 초기화가 필요없으며 초기화 과정을 보다 편리하게 해주는 생성자
- 반드시 지정생성자를 호출해줘야 함
- 상속 시(상속은 가능), 편의생성자는 서브클래스에서 재정의 못함
### 2023.03.20
### Copy On Write
- 컴퓨터 프로그래밍에서 메모리 관리 기법 중 하나
- Write가 일어났을 때 Copy를 수행함
- **값 타입**을 복사할 경우, 매번 메모리 공간이 할당됨 → 메모리에 큰 부담
- 그래서 복제 작업 시 원본 데이터를 복제하지 않고, 원본 데이터와 복제본이 같은 메모리 공간을 공유 → 수정이 일어나면 그 때서야 새로운 메모리 공간을 할당하여 메모리 낭비 방지
- swift의 기본 타입 (Int, String, Double 등)에는 기본적으로 copy on write가 구현되어 있음

---
### 2023.03.09
```swift
extension UIImage {
    func aspectFitImage(inRect rect: CGRect) -> UIImage? {
        let width = self.size.width
        let height = self.size.height
        let aspectWidth = rect.width / width
        let aspectHeight = rect.height / height
        let scaleFactor = aspectWidth > aspectHeight ? rect.size.height / height : rect.size.width / width

        UIGraphicsBeginImageContextWithOptions(CGSize(width: width * scaleFactor, height: height * scaleFactor), false, 0.0)
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: width * scaleFactor, height: height * scaleFactor))

        defer {
            UIGraphicsEndImageContext()
        }
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    

//
//    func resized(to size: CGSize) -> UIImage {
//        let aspectRatio = self.size.width / self.size.height
//        let targetWidth = size.width
//        let targetHeight = targetWidth / aspectRatio
//        let targetSize = CGSize(width: targetWidth, height: targetHeight)
//
//        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0)
//        self.draw(in: CGRect(origin: .zero, size: targetSize))
//        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return resizedImage ?? self
//    }
    
    //이미지의 사이즈를 구하는 함수
    func getImageSize() -> CGSize {
        return CGSize(width: self.size.width, height: self.size.height)
    }
    
    //UIGraphicsBeginImageContextWithOptions보다는 UIGraphicsImageRenderer을 사용할 것
    func resized(to length: CGFloat) -> UIImage {
        let width = self.size.width
        let height = self.size.height
        let resizeLength: CGFloat = length
        print("🍯🍯🍯🍯🍯", "width: \(width), height: \(height), scale: \(scale)")
        var scale: CGFloat

        if height >= width {
            scale = width <= resizeLength ? 1 : resizeLength / width
        } else {
            scale = height <= resizeLength ? 1 :resizeLength / height
        }
  
        let newHeight = height * scale
        let newWidth = width * scale
        let size = CGSize(width: newWidth, height: newHeight)
        print("🍯🍯🍯🍯🍯", "newSize: \(size)")
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return renderImage
    }
    
    // vImage를 이용해 resize하는 함수
    // import Accelerate가 필요
    public func resizedWithVImage(to targetSize: CGSize) -> UIImage? {
        guard let cgImage = self.cgImage else { return self }
        
        var format = vImage_CGImageFormat(bitsPerComponent: UInt32(cgImage.bitsPerComponent), bitsPerPixel: UInt32(cgImage.bitsPerPixel), colorSpace: nil,
                                          bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.first.rawValue),
                                          version: 0, decode: nil, renderingIntent: CGColorRenderingIntent.defaultIntent)
        var sourceBuffer = vImage_Buffer()
        defer {
            sourceBuffer.data.deallocate()
        }
        
        var error = vImageBuffer_InitWithCGImage(&sourceBuffer, &format, nil, cgImage, numericCast(kvImageNoFlags))
        guard error == kvImageNoError else { return self }
        
        // create a destination buffer
        let destWidth = Int(targetSize.width)
        let destHeight = Int(targetSize.height)
        let bytesPerPixel = cgImage.bitsPerPixel / 8
        let destBytesPerRow = destWidth * bytesPerPixel
        let destData = UnsafeMutablePointer<UInt8>.allocate(capacity: destHeight * destBytesPerRow)
        defer {
            destData.deallocate()
        }
        
        var destBuffer = vImage_Buffer(data: destData, height: vImagePixelCount(destHeight), width: vImagePixelCount(destWidth), rowBytes: destBytesPerRow)
        
        // scale the image
        error = vImageScale_ARGB8888(&sourceBuffer, &destBuffer, nil, numericCast(kvImageHighQualityResampling))
        guard error == kvImageNoError else { return self }
        
        // create a CGImage from vImage_Buffer
        let destCGImage = vImageCreateCGImageFromBuffer(&destBuffer, &format, nil, nil, numericCast(kvImageNoFlags), &error)?.takeRetainedValue()
        guard error == kvImageNoError else { return self }
        
        // create a UIImage
        let resizedImage = destCGImage.flatMap { UIImage(cgImage: $0, scale: 0.0, orientation: self.imageOrientation) }
        return resizedImage
    }
}

```


### 2023.03.08
```swift
class CircularProgressBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var lineWidth: CGFloat = 5
    
    var value: Double? {
        didSet {
            guard let _ = value else { return }
            setProgress(self.bounds)
        }
    }
    
    override func draw(_ rect: CGRect) {
        let bezierPath = UIBezierPath()

        bezierPath.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midX - ((lineWidth - 1) / 2), startAngle: 0, endAngle: .pi * 2, clockwise: true)

        bezierPath.lineWidth = 1
        UIColor.systemGray4.set()
        bezierPath.stroke()
    }
    
    func setProgress(_ rect: CGRect) {
        guard let value = self.value else {
            return
        }

        // TableView나 CollectionView에서 재생성 될때 계속 추가되는 것을 막기 위해 제거
        self.subviews.forEach { $0.removeFromSuperview() }
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        let bezierPath = UIBezierPath()

        bezierPath.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midX - ((lineWidth - 1) / 2), startAngle: -.pi / 2, endAngle: ((.pi * 2) * value) - (.pi / 2), clockwise: true)

        let shapeLayer = CAShapeLayer()

        shapeLayer.path = bezierPath.cgPath
        shapeLayer.lineCap = .round    // 프로그래스 바의 끝을 둥글게 설정

        let color: UIColor = .systemGray

        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth

        self.layer.addSublayer(shapeLayer)

        // 프로그래스바 중심에 수치 입력을 위해 UILabel 추가
        let label = UILabel()
        label.text = String(Int(value * 100))
        label.textColor = .label
        label.font = UIFont.Pretandard(type: .Regular, size: 16)

        self.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
```
- 사용처
```swift
    let circularProgress: CircularProgressBar = CircularProgressBar()
    circularProgress.value = 0.3
```

```swift
class CircularProgressView: UIView {
    
    private let shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupShapeLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupShapeLayer()
    }
    
    private func setupShapeLayer() {
        // Set up the shape layer properties
        shapeLayer.lineWidth = 10
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        
        // Add the shape layer to the view's layer
        layer.addSublayer(shapeLayer)
    }
    
    func setProgress(_ progress: CGFloat) {
        // Update the shape layer's path based on the progress
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - shapeLayer.lineWidth / 2
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + progress * 2 * CGFloat.pi
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        shapeLayer.path = path.cgPath
    }
}

```
- 사용처
```swift
    let circularProgressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    circularProgressView.center = view.center
    view.addSubview(circularProgressView)
    
    circularProgressView.setProgress(0.5)
```
### 2023.03.07 
- frame 기반의 레이아웃을 잡은 경우, `UIView.animate`에서 `IflayoutNeeded`메서드가 필요 없음
-`IfLayoutNeeded`는 autoLayout으로 잡은 경우에만 사용함
```swift
var tabBarFrame = self.tabBarController?.tabBar.frame ?? CGRect(x: 0, y: 0, width: self.view.frame.height, height: 70)
var viewYPoint = self.view.frame.size.height - (tabBarFrame.size.height)
tabBarFrame.origin.y = self.view.frame.size.height + (tabBarFrame.size.height)
        
UIView.animate(withDuration: 0.5) {
    self.tabBarController?.tabBar.frame = tabBarFrame
            
} completion: { finished in
            
    UIView.animate(withDuration: 0.5) {
        self.testView.frame = CGRect(x: tabBarFrame.origin.x, y: viewYPoint, width: tabBarFrame.width, height: tabBarFrame.height)
    }
}
```

### 2023.03.06
```swift
let items: [Any] = ["check1", "check2", 2, 5, memoryViewModel.safeImageArray[0]]
let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
present(ac, animated: true)
ac.completionWithItemsHandler = { (activity, completed, items, error) in
}
```

### 2022.11.11
#### 
### 2022.11.09
#### UIButton Configuration
```swift
import UIKit

extension UIButton.Configuration {
    static func setWineButtonStyle(_ title: String, image: UIImage) -> UIButton.Configuration {
        var configuration = self.plain()
        var titleAttributed = AttributedString.init(title)
        titleAttributed.font = UIFont(name: "GowunBatang-Regular", size: 18)
        titleAttributed.foregroundColor = .darkGray
        configuration.title = title
        configuration.titleAlignment = .center
        configuration.image = image
//        configuration.baseForegroundColor = .darkGray
//        configuration.baseBackgroundColor = .myGreen
        configuration.imagePlacement = .top
        configuration.imagePadding = 8
        configuration.attributedTitle = titleAttributed
        return configuration
    }
}
```
#### scrollView horizontal에 여러가지 component 넣기
```swift
    final private func setConstraints() {
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        scrollView.addSubview(contentView)
        [firstLabel, secondLabel, thirdLabel, firstImageView, secondImageView, thirdImageView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(300)
        }
        
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        let width = UIScreen.main.bounds.width
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.height.equalTo(scrollView.frameLayoutGuide)
            make.width.equalTo(width * 3)
        }
        
        firstImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.height.equalTo(300)
            make.width.equalTo(width)
        }
        firstLabel.snp.makeConstraints { make in
            make.centerX.equalTo(firstImageView)
            make.top.equalTo(contentView).offset(50)
        }
        
        secondImageView.snp.makeConstraints { make in
            make.leading.equalTo(firstImageView.snp.trailing)
            make.bottom.equalTo(contentView)
            make.height.width.equalTo(firstImageView)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.centerX.equalTo(secondImageView)
            make.top.equalTo(contentView).offset(50)
        }
        
        thirdImageView.snp.makeConstraints { make in
            make.leading.equalTo(secondImageView.snp.trailing)
            make.bottom.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.height.width.equalTo(firstImageView)
        }
        
        thirdLabel.snp.makeConstraints { make in
            make.centerX.equalTo(thirdImageView)
            make.top.equalTo(contentView).offset(50)
        }
    }
```
---
### 2022.07.08
#### 삼항 연산자
- 계산 속성(computed property)을 이용하여 서버에서 받아온 값들을 사용할 때, if문을 길게 썼었는데 삼항 연산자를 이용하여 편리
```swift
    var realm0NotEmpty: Bool {
        if !realmManager.isEmpty(id: 0) {
            return true
        } else {
            return false
        }
    }
````
- 위와 아래가 완전히 동일하게 작동
```swift
    var realm0NotEmpty: Bool {
        return !realmManager.isEmpty(id: 0) ? true : false
    }
````
---
### 2022.07.05
#### realm 하나의 객체에서 두개 요소 쓰기
```swift
import Foundation
import RealmSwift

class RealmManager {
    let realm: Realm
    
    static let shared = RealmManager()
    
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func realmPrint(id: Int) {
        print(realm.objects(Photo.self).filter("id == \(id)").first)
    }

    func isEmpty(id: Int) -> Bool {
        return realm.objects(Photo.self).filter("id == \(id)").isEmpty
    }

    func createRealm(id: Int, with identifiers: [String]) {
        let photoIdentifiers = Photo()
        photoIdentifiers.id = id
        photoIdentifiers.photoIdentifierArray = identifiers
        photoIdentifiers.updateDate = Date()
        do {
            try realm.write {
                realm.add(photoIdentifiers)
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func readRealm(id: Int) -> [String] {
        guard let readIdentifiers = realm.objects(Photo.self).filter("id == \(id)").first else { fatalError("Error reading Realm") }
        
        let currentIdentifier = readIdentifiers.photoIdentifier
        var temporaryArray = [String]()
        for oneIdentifier in currentIdentifier {
            temporaryArray.append(oneIdentifier)
        }
        return temporaryArray
    }

    func readRealmDate(id: Int) -> String {
        guard let updateDate = realm.objects(Photo.self).filter("id == \(id)").first?.updateDate else { fatalError() }
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy년 MMMM d일"
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: updateDate)
    }

    func updateRealm(id: Int, with results: [String]) {
        var resultArray: [String] = []
        
        if let updateRealm = realm.objects(Photo.self).filter("id == \(id)").first {
            for result in results {
                resultArray.append(result)
            }
            do {
                try realm.write({
                    updateRealm.photoIdentifierArray = resultArray
                    updateRealm.updateDate = Date()
                })
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }

    func deleteRealm() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

```
---
### 2022.07.04
#### UserDefaults 쓰기
```swift
    UserDefaults.standard.set(true, forKey: UserKey.isUploadKey) // 값 설정
    UserDefaults.standard.bool(forKey: UserKey.isUploadKey) // 값 읽기
```
---
### 2022.07.01
#### 스크롤뷰 팁
- 스크롤이 필요없는 상황에서도 스크롤 있는 것처럼 만들기
    - 레이블 하나만 있는 뷰컨에서 스크롤 있는 것처럼 만들고 싶을 때는 스크롤뷰를 뷰 사이즈보다 약간 크게 잡고, 컨텐트뷰를 스크롤뷰의 높이와 똑같이 잡으면 된다.
```swift
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(noMemoryLabel)
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(4)
        }

        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(scrollView)
        }

        noMemoryLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
```
---
### 2022.06.27
#### push 될 때 bottom bar 사라지도록 하기
- viewWillAppear와 viewWillDisAppear를 사용하면 viewDisAppear되면서 바로 bottom bar가 나타나기 때문에 잔상(?) 같은 느낌을 줌
- bottom bar를 없애고 싶은 뷰컨에서 bottom bar 없앨 뷰컨으로 이어질 때 설정하면 됨.
- bottom bar를 없애고 싶은 뷰컨에서 설정하면 앞선 뷰컨에서도 사라짐
```swift
let detailVC = DetailViewController()
detailVC.hidesBottomBarWhenPushed = true
navigationController?.pushViewController(detailVC, animated: true)
```
---
### 2022.06.24
#### webView
- 웹뷰 속성 설정
```swift
var webView: WKWebView?
```
- Delegate 설정
```swift
webView?.uiDelegate = self
webView?.navigationDelegate = self
```
- 레이아웃 잡기
```swift
guard let webView = webView else { return }
view.addSubview(webView)
```
- webView 셋팅
```swift
    private func cookieSetting() {
        let config = WKWebViewConfiguration()
        let wkDataStore = WKWebsiteDataStore.nonPersistent()
        guard let url = URL(string: url) else {return}
        let request = URLRequest(url: url)
        config.websiteDataStore = wkDataStore
        webView = WKWebView(frame: .zero, configuration: config)
        webView?.load(request)
    }
```
---
### 2022.06.23
#### Alamofire responseDecodable
- Model 만들기
```swift
struct UserSubscribe: Codable {
    let keepSubscribing: Int //구독여부 1- 구독 안하는 중, 2- 구독 하는 중
    let getGift: Bool // null - 선물하기 안 받음, true - 선물하기 받음
    
    enum CodingKeys: String, CodingKey {
        case keepSubscribing = "susbcribe"
        case getGift = "orders"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        keepSubscribing = try container.decode(Int.self, forKey: .keepSubscribing)
        getGift = try container.decode(Bool.self, forKey: .getGift)
    }
}
```
- 통신 메서드 설정
```swift
    func testMemoryTap(completion: @escaping (Result<UserSubscribe, Error>) -> Void) {
        let url = "\(temporaryUrl)/main"

        AF.request(url, method: .get, encoding: URLEncoding.default, headers: header, interceptor: interceptor).responseDecodable { (response: DataResponse<UserSubscribe, AFError>) in
            let tet = response.result
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
```
- 사용할 때
```swift
    func testOrderHistroyAPI() {
        apiManager.testMemoryTap { response in
            switch response {
            case .success(let userSubscribe):
                dump(userSubscribe)
            case .failure(let error):
                print(error)
            }
        }
    }
```
- 결과
```JSON
▿ PhotyApp.UserSubscribe
  - keepSubscribing: 1
  - getGift: true
```
---
### 2022.06.22. 
#### collectionViewCell에 버튼 동작하게 만들기 (didSelect X)
- collectiveViewCell에 버튼 만들고 action 추가
```swift
let orderDetailButton = UIButton()
self.orderDetailButton.addTarget(self, action: #selector(tapOrderDetailButton(_:)), for: .touchUpInside)
```
- 클로져 형식의 변수 하나 추가
```swift
var tapOrderDetailButtonPressed : (OrderListTableViewCell) -> Void = { (sender) in }
```
- collectionView Delegate에서 사용 (cellForRowAt)
```swift
cell.trackingButtonActionPressed = { [weak self] sender in
    let linkUrl = NSURL(string: "https://tracker.delivery/#/kr.epost/1113903493690")
    let safariView: SFSafariViewController = SFSafariViewController(url: linkUrl! as URL)
    self?.present(safariView, animated: true, completion: nil)
}
```
---
### 2022.06.21
#### Int를 decimal 형태로
```swift
let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .decimal

let price = 10005000
let result = numberFormatter.string(from: NSNumber(value:price))!
print(result) // "10,005,000"
```
---
### 2022.06.20
#### 서버에서 받은 string 날짜를 원하는 형식으로 바꾸기
```swift
let dateString: String = data.createDate
let iso8601DateFormatter = ISO8601DateFormatter()
iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] // option형태의 포맷
let date = iso8601DateFormatter.date(from: dateString)

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy. MM. dd"
self.dateLbl.text = dateFormatter.string(for: date!)
```
---
### 2022.06.19
#### 테이블뷰 셀에 버튼을 만들었을 때
```swift
    var orderDetailButtonAction : (() -> ())?
    var trackingButtonAction : (() -> ())?
```
---
### 2022.06.17
#### url로 이미지를 불러올 때 url에 한글이나 특정 문자 포함되어 있을 때는 어떤 처리를 해야 한다.
- addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
```swift
    // KingFisher 캐시없이 이미지 받아오기
    private func kingFisherImage() {
        let processor = DownsamplingImageProcessor(size: contentView.bounds.size)
        guard let url = imageUrl else { return }
        print("💩url: \(url)")
        guard let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        print("💩urlString: \(urlString)")//문제발생
        guard let safeURL = URL(string: urlString) else { return }
        print("💩safeURL: \(safeURL)")

        memoryImageView.kf.indicatorType = .activity
        memoryImageView.kf.setImage(with: safeURL, options: [.processor(processor), .transition(.fade(1)),.scaleFactor(UIScreen.main.scale)]) {
            result in
            switch result {
            case .failure(let error):
                dump(error.localizedDescription)
            case .success(let value):
                print("success")
            }
        }
    }
```
---
### 2022.06.16
#### navigationBar setting
```swift
// Make the navigation bar's title with red text.
let appearance = UINavigationBarAppearance()
appearance.configureWithOpaqueBackground()
appearance.backgroundColor = UIColor.systemRed
appearance.titleTextAttributes = [.foregroundColor: UIColor.lightText] // With a red background, make the title more readable.
navigationItem.standardAppearance = appearance
navigationItem.scrollEdgeAppearance = appearance
navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.

// Make all buttons with green text.
let buttonAppearance = UIBarButtonItemAppearance()
buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGreen]
navigationItem.standardAppearance?.buttonAppearance = buttonAppearance
navigationItem.compactAppearance?.buttonAppearance = buttonAppearance // For iPhone small navigation bar in landscape.

// Make the done style button with yellow text.
let doneButtonAppearance = UIBarButtonItemAppearance()
doneButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemYellow]
navigationItem.standardAppearance?.doneButtonAppearance = doneButtonAppearance
navigationItem.compactAppearance?.doneButtonAppearance = doneButtonAppearance // For iPhone small navigation bar in landscape.
```
---
### 2022.06.15
#### Router
```swift

import Foundation
import Alamofire

enum APIRouter {
  case getMemory
  case getUserSubscribe
  case uploadPhoto(String)
  case fetchAccessToken(String)

  var baseURL: String {
    switch self {
    case .getMemory, .getUserSubscribe, .uploadPhoto:
      return "http://localhost:5001"
    case .fetchAccessToken:
      return "http://localhost:5001"
    }
  }

  var path: String {
    switch self {
    case .getMemory:
      return "/memory"
    case .getUserSubscribe:
      return "/main"
    case .uploadPhoto:
      return "/photo"
    case .fetchAccessToken:
      return "/signup/social"
    }
  }

  var method: HTTPMethod {
    switch self {
    case .getMemory:
      return .get
    case .getUserSubscribe:
      return .get
    case .uploadPhoto:
      return .post
    case .fetchAccessToken:
      return .post
    }
  }

  var parameters: [String: String]? {
    switch self {
    case .getUserSubscribe, .getMemory:
//        return ["Authorization": KeyChain.accessToken() ?? ""]
        return ["Authorization": "Bearer \(UserKey.bearerToken)"]
    case .uploadPhoto(let parameter):
      return ["orderType": parameter]
    case .fetchAccessToken(let accessCode):
        return ["snsId": LoginSession.shared.snsId(), "token": LoginSession.shared.accessToken() ?? "", "social": LoginSession.shared.social()]
    }
  }
}

// MARK: - URLRequestConvertible
extension APIRouter: URLRequestConvertible {
  func asURLRequest() throws -> URLRequest {
    let url = try baseURL.asURL().appendingPathComponent(path)
    var request = URLRequest(url: url)
    request.method = method
    if method == .get {
      request = try URLEncodedFormParameterEncoder()
        .encode(parameters, into: request)
    } else if method == .post {
      request = try JSONParameterEncoder().encode(parameters, into: request)
      request.setValue("application/json", forHTTPHeaderField: "Accept")
    }
    return request
  }
}

```
---
### 2022.06.13  
#### ViewController 레이아웃 결정 순서
1. viewWillLayoutSubviews()
2. viewController의 컨텐트 뷰의 layoutSubviews()
3. viewDidLayoutSubviews()
---
### 2022.06.12
#### scrollView
- 스크롤뷰와 그 안에 content를 담을 뷰 2개 필요
```swift
    private let memoryScrollView = UIScrollView()
    private let contentView = UIView()
```
- scrollView는 view에, content뷰는 scrollView에 addSubView해주기
```swift
[memoryScrollView, initialImageView].forEach {
    view.addSubview(memoryScrollView)
    memoryScrollView.addSubview(contentView)
    $0.translatesAutoresizingMaskIntoConstraints = false
}
```
---
### 2022.06.10
#### Alamofire GET
```swift
    func getPhotoForMemory(completion: @escaping ([OrderMemory]) -> Void) {

        let url = "\(temporaryUrl)/memory"
        print(url)
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: header).responseDecodable(of: MemoryModel.self) { response in
            print("😄:\(response.value)")

            guard let memories = response.value else { return }
            completion(memories.orderMemory)
        }
    }
```
---
### 2022.06.09
#### 사진 권한 설정
#### info.plist 설정

- Privacy - Photo Library Usage Description 키 항목 추가
- 사진권한 요청 시 나타낼 메시지를 value로 설정

#### 접근권한 요청

```swift
PHPhotoLibrary.requestAuthorization(for: .readWrite) { authorizationStatus in }
```
```swift
PHPhotoLibrary.requestAuthorization(for: .readWrite) { authorizationStatus in
    switch authorizationStatus {
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        case .limited:
            print("limited")
            //사진 선택 -> 사진 하나도 안 고른 경우, 피커에서 취소 누른 경우, 하나라도 선택한 경우
        case .authorized:
            print("authorized")
             //모든 사진에 대한 접근 권한 허용
        case .denied:
            print("denied")
             //허용 안 함
        }
    }
}
```
#### `PHAuthorizationStatus`
- **`notDetermined`** : 사용자가 앱의 라이브러리 권한을 아무것도 설정하지 않은 경우 입니다.
- **`restricted`** : 사용자를 통해 권한을 부여 받는 것이 아니지만 라이브러리 권한에 제한이 생긴 경우 입니다. 사진을 얻어 올 수 없습니다
- **`denied`** : 사용자가 접근을 거부한 것입니다. 사진을 얻어 올 수 없습니다 🥲
- **`authorized`** : 사용자가 앱에게 라이브러리를 사용할 수 있도록 권한을 설정한 경우 입니다.
- **`limited`** : (iOS 14+) 사용자가 제한된 접근 권한을 부여한 경우 입니다.
- 원하는 곳에서 권한을 확인하여 사용하면 됨

```swift
switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
    case .restricted:
    case .denied:
    case .notDetermined:
    case .limited:
    case .authorized:
}

//또는 특정 권한만 확인하여 사용해도 됨
if PHPhotoLibrary.authorizationStatus(for: .readWrite) == .authorized { //코드
}
```

- 권한 요청이 비동기적으로 이루어지기 때문에 completion으로 처리하는 것도 방법

```swift
func requestPHPhotoLibraryAuthorization(completion: @escaping () -> Void) {
    PHPhotoLibrary.requestAuthorization(for: .readWrite) { authorization in
        switch authorization {
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        case .denied, .limited:
            completion()
        case .authorized:
            completion()
        }
    }
}
```
---
### 2022.06.08  
#### addKeyFrame을 통한 애니메이션
```swift
UIView.animateKeyframes(withDuration: 4, delay: 0) {
    UIView.addKeyframe(withRelativeStartTime: 0 / 4, relativeDuration: 1 / 4) {
        // UI 변화, alpha 값 등 변화
    }
    UIView.addKeyframe(withRelativeStartTime: 1 / 4, relativeDuration: 1 / 4) {
        // UI 변화, alpha 값 등 변화
    }
    UIView.addKeyframe(withRelativeStartTime: 2 / 4, relativeDuration: 1 / 4) {
        // UI 변화, alpha 값 등 변화
    }
    UIView.addKeyframe(withRelativeStartTime: 3 / 4, relativeDuration: 1 / 4) {
        // UI 변화, alpha 값 등 변화
    } completion: {_ in
        //completion 코드
    }
```
---
### 2022.06.06
#### Observer로 다른 뷰컨의 테이블뷰 로드하기 (모달 뷰컨 dismiss 후)
- modal로 뜨는 뷰컨이 사라질 때, Notification 만들기
```swift
// DetailViewController.swift
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    NotificationCenter.default.post(name: NSNotification.Name("DismissDetailView"), object: nil, userInfo: nil)
}
```
- 테이블뷰가 있는 뷰컨에서 Observer만들고 tableView reload
```swift

```class HomeViewController: UIViewController {
  @IBOutlet weak var collectionview: UICollectionView!

  override func viewDidLoad() {
      super.viewDidLoad()

      NotificationCenter.default.addObserver(
          self,
          selector: #selector(self.didDismissDetailNotification(_:)),
          name: NSNotification.Name("DismissDetailView"),
          object: nil
      )
  }

  @objc func didDismissDetailNotification(_ notification: Notification) {
      DispatchQueue.main.async {
          self.collectionview.reloadData()
      }
  }
}

---
### 2022.06.05
#### label을 넣은 Custom UIImageView
```swift
class CustomImageView: UIImageView {
    var quizTitle = CustomLabel(title: "")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(label title: String) {
        super.init(frame: .zero)
        self.image = UIImage(named: "퀴즈배경")
        setLabel(title: title)
    }
    func setLabel(title: String) {
        self.addSubview(quizTitle)
        quizTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quizTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            quizTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            quizTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            quizTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            quizTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            quizTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
        ])
        quizTitle.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```
---
### 2022.06.04
#### 앱 가로모드 설정 막기
```swift
func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {     
        // 세로방향 고정
    return UIInterfaceOrientationMask.portrait
}
```
---
### 2022.06.03
#### PHAsset 접근 권한 받기
```swift
PHPhotoLibrary.requestAuthorization(for: .readWrite) { authorizationStatus in
    switch authorizationStatus {
    case .notDetermined:
        print("notDetermined")
    case .restricted:
        print("restricted")
    case .authorized:
        print("authorized") //모든 사진에 대한 접근 권한 허용
    case .limited:
        print("limited") //사진 선택 -> 사진 하나도 안 고른 경우, 피커에서 취소 누른 경우
    case .denied:
        print("denied") //허용 안 함
    }
}
```
---
### 2022.06.02
#### TabBar에서 로그인 화면 구현
- 탭바 컨트롤러에서 로그인이 필요할 때는, 로그인 하는 뷰컨을 present하고 dismiss하는 방식으로 접근
- 로그인처럼 한 번만 하고 이후부터는 필요없는 작업을 스택에 쌓으면 메모리만 차지하는 현상이 발생하기 때문에 필요한 작업(=로그인)만 끝내고는 dismiss해주는 게 좋음
```swift
//isLoggedIn이라는 bool을 변수로 하나 설정
//탭바에서 아래 로직 구현
if !isLoggedIn {
    let vc = LoginViewController()
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: false, completion: nil)
}
```
- 실제 LoginViewController에서는 아래처럼 특정 action에서 dismiss시켜주면 됨
```swift
    @objc func loginButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
```
---
### 2022.06.01
#### animate
```swift
extension HomeViewController {
    private func animateArrow() {
        UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: .curveEaseInOut) {
            self.arrowImageView.snp.updateConstraints {
                $0.bottom.equalTo(self.photoPickButton.snp.top).inset(15)
            }
            self.arrowImageView.layoutIfNeeded()
        } completion: { _ in
            self.arrowImageView.removeFromSuperview()
        }
    }
}
```
- `withDuration` : 애니메이션 지속시간
- `delay` : 애니메이션 시작 시간 (delay를 줄 것인가 말 것인가)
- `usingSpringWithDamping` : 정지 상태가 될 때 스프링 애니메이션의 감소 비율(0.0 ~ 1.0) 진동없이 부드럽게 감속하려면 0.0에 가깝게 값 설정
- `initialSpringVelocity` : 초기 스프링 속도. 커질수록 스프링이 띠용띠용 함
---
### 2022.05.31
#### PHAsset fetch할 때, 스크린샷 제외하기
```swift
let predicate = NSPredicate(format: "mediaType = %d AND isFavorite == %@ AND (creationDate > %@) AND NOT ((mediaSubtype & %d) != 0)", PHAssetMediaType.image.rawValue, NSNumber(value: true), timeLimit as NSDate, PHAssetMediaSubtype.photoScreenshot.rawValue)
favoriteFetchOption.predicate = predicate
```
---
### 2022.05.30 
#### stackView
- stackView만 addSubview & translatesAutoresizingMaskIntoConstraints = false 해주면 됨
- stackView의 하위요소들의 레이아웃은 오토레이아웃 잡아줄 때 설정해주면 됨
#### UIView 위에 레이블, 버튼 올리기
```swift
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        return view
    }()
```
- 올리고자 하는 요소(UIView)에 addSubview를 해주면 됨
- 그리고 레이아웃 잡을 때는 해당 UIView를 equalTo로 잡아주면 됨
---
### 2022.05.28 
#### custom버튼과 enum 함께 활용
```swift
class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String, size: CGFloat = 13, bgColor: ButtonColor, textColor: TextColor) {
        super.init(frame: .zero)
        //frame.size = CGSize(width: 355, height: 52)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.Pretandard(type: .Regular, size: size)
        tintColor = textColor.textColor
        setTitleColor(textColor.textColor, for: .normal)
        backgroundColor = bgColor.bgColor
    }
    enum ButtonColor {
        case enableButton
        case disableButton
        case pickButton

        var bgColor: UIColor {
            switch self {
            case .enableButton:
                return HomeColor.enableButton
            case .disableButton:
                return HomeColor.disableButton
            case .pickButton:
                return HomeColor.homeBackGround
            }
        }
    }
    
    enum TextColor {
        case uploadTextInBtn
        case pickTextInBtn
        
        var textColor: UIColor {
            switch self {
            case .uploadTextInBtn:
                return HomeColor.uploadTextInBtn
            case .pickTextInBtn:
                return HomeColor.pickTextInBtn
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```
---
### 2022.05.27
#### Hex -> UIColor
```swift
extension UIColor {
  
  convenience init(hexString: String, alpha: CGFloat = 1.0) {
    var cString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") { cString.removeFirst() }
    
    if cString.count != 6 {
        self.init(hexString: "ff0000") // return red color for wrong hex input
      return
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }
}
```
---
### 2022.05.26
#### KingFisher
- SPM 이용하여 'Add Package'
    - https://github.com/onevcat/Kingfisher
- import KingFisher
```swift
import KingFisher
```
- 간단하게 Image를 받아올 때
```swift
memoryImageView.kf.setImage(with: stringUrl)
```
- 캐시가 없으면 이미지를 다운받고 있으면 캐시이미지 이용
```swift
private func cacheImage() {
    guard let originalUrl = imageUrl else { return }

    ImageCache.default.retrieveImage(forKey: originalUrl) { result in
        switch result {
        case .success(let value):
            if let image = value.image {
                self.memoryImageView.image = image
            } else {
                guard let safeUrl = URL(string: originalUrl) else { return }
                let resource = ImageResource(downloadURL: safeUrl, cacheKey: originalUrl)
            }
        case .failure(let error):
            print("Error retrieving Image: \(error)")
        }
    }
}
```
- 사용 (collectionView에서)
```swift
// CollectionViewCell Class
var imageUrl: String? {
    didSet {
        cacheImage()
    }
}
// CollectionView의 cellForItemAt 델리게이트 메서드에서
cell.imageUrl = urlArray[indexPath.section][indexPath.item]
```
---
### 2022.05.25
#### CollectionViewCell cornerRadius
```swift
class ExampleCollectionViewCell: UICollectionViewCell {
    override func layoutSubviews() {
        // cell rounded section
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
        
        // cell shadow section
        self.contentView.layer.cornerRadius = 15.0
        self.contentView.layer.borderWidth = 5.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.6
        self.layer.cornerRadius = 15.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
}
```
---
### 2022.05.24
#### Alamofire - responseDecodable
- import Alamofire
```swift
import Alamofire
```
- 받아올 JSON 데이터를 위한 모델 만들기
```swift
struct MemoryModel: Codable {
    let order: [OrderMemory]
}

struct OrderMemory: Codable {
    let id, year, month: Int
    let createdAt: String
    let photos: [String]
}
```
- GET을 위한 메서드
    - 위에서 만든 모델 형식으로 Decodable 해주면 됨
```swift
    // MARK: - GET (서버로부터 Memory탭의 collectionView에 표시할 것)
    func getPhotoForMemory(completion: @escaping (DataResponse<MemoryModel, AFError>) -> Void) {
        guard let url = URL(string: "https://26b2ca1f-03de-4980-a87f-64ffe4540a90.mock.pstmn.io/memory") else { fatalError() }

        AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: MemoryModel.self) { response in
            switch response.result {
            case .success(let data):
                completion(response)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(response)
            }
        }
    }
```
---
### 2022.05.23
#### CollectionView Size 설정 방법
```swift
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: HomeLayout.collectionWidth, height: HomeLayout.collectionWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return HomeCell.spacingWidth
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return HomeCell.spacingWidth
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

}
public struct HomeLayout {
    static let imageSpacing: CGFloat = 8
    static let spacingBetweenCell = (HomeCell.spacingWidth * (HomeCell.cellColumns - 1))
    static let collectionWidth = (UIScreen.main.bounds.width - (HomeLayout.imageSpacing * 2) - spacingBetweenCell) / HomeCell.cellColumns
}
public struct HomeCell {
    static let spacingWidth: CGFloat = 3
    static let cellColumns: CGFloat = 5
    static let multiplyNumber = 0.87
}
```
---
### 2022.05.22
#### 한글의 자음만 따오는 String Extension  
```swift
extension String {
    
    func getInitialLetter() -> String {
        let hangul = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        var result = ""
        
        // 문자열하나씩 짤라서 확인
        for char in self {
            let octal = char.unicodeScalars[char.unicodeScalars.startIndex].value
            if 44032...55203 ~= octal { // 유니코드가 한글값 일때만 분리작업
                let index = (octal - 0xac00) / 28 / 21
                result = result + hangul[Int(index)]
            }
        }
        return result
    }
}

```
---
### 2022.05.20  
#### View의 Drawing Cycle
- updateConstraint()
- layoutSubviews()
- draw
---
### 2022.05.18
#### UIPageControl
- 변수 선언
```swift
let memoryPageControl = UIPageControl()
```
- AutoLayout 잡기
    - 스크롤뷰와 함께 쓸때 그냥 스크롤뷰 위에 올리면 됨
```swift
memoryPageControl.snp.makeConstraints {
    $0.centerX.equalTo(view.safeAreaLayoutGuide)
    $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(120)
    $0.height.equalTo(40)
    $0.width.equalTo(view.safeAreaLayoutGuide)
}
```
- 기본 설정
```swift
final private func memoryPageControl() {
    memoryPageControl.numberOfPages = initialGuideImage.count
    memoryPageControl.currentPage = 0
    memoryPageControl.pageIndicatorTintColor = .darkGray
    memoryPageControl.currentPageIndicatorTintColor = .lightGray
}
```
- 스크롤뷰와 함께 currentPage가 반영될 수 있도록
    - 스크롤뷰의 델리게이트 메서드에서 수행
```swift
extension TemporaryViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if fmod(memoryScrollView.contentOffset.x, memoryScrollView.frame.size.width) == 0 {
            let pageNumber = Int(memoryScrollView.contentOffset.x/memoryScrollView.frame.size.width)
            memoryPageControl.currentPage = pageNumber
        }
    }
}
```
---
### 2022.05.17  
#### UIScrolControll
- 변수 선언
```swift
let memoryScrollView = UIScrollView()
```
- AutoLayout 잡기
```swift
view.addSubview(memoryScrollView)
memoryScrollView.snp.makeConstraints {
    $0.leading.top.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
}
```
- scrollerView setting
```swift
final private func setScrollView() {
    memoryScrollView.delegate = self
    memoryScrollView.alwaysBounceVertical = false
    memoryScrollView.showsVerticalScrollIndicator = false
    memoryScrollView.showsHorizontalScrollIndicator = false
    memoryScrollView.isScrollEnabled = true
    memoryScrollView.isPagingEnabled = true
    memoryScrollView.bounces = true
}
```
- scrollView 속 이미지 셋팅
```swift
final private func setImageViewInScrollView() {
    for index in 0..<initialGuideImage.count {
        let imageView = UIImageView()
        let positionX = self.view.frame.width * CGFloat(index)
        imageView.frame = CGRect(x: positionX, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.image = initialGuideImage[index]
        imageView.contentMode = .scaleAspectFit
        memoryScrollView.contentSize.width = imageView.frame.width * CGFloat(index + 1)
        memoryScrollView.addSubview(imageView)
    }
}
```
---
### 2022.05.13  
#### UIPageControl
- 변수 선언
```swift
let pageControl = UIPageControl()
```
- UI잡기
    - 이미지뷰와 사용할 거면 이미지뷰 밑에 별도로 Auto Layout 잡아야 함
```swift
[pageControl].forEach {
    view.addSubview($0)
    $0.translatesAutoresizingMaskIntoConstraints = false
}
        
NSLayoutConstraint.activate([
    pageControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
    pageControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
    pageControl.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 10),
    pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
])

```
- 기본 속성 설정
```swift
pageControl.numberOfPages = images.count
pageControl.currentPage = 0
pageControl.pageIndicatorTintColor = UIColor.lightGray
pageControl.currentPageIndicatorTintColor = UIColor.darkGray
pageControl.backgroundColor = .red
        
pageControl.addTarget(self, action: #selector(pageControllerTapped(_:)), for: .valueChanged)
```
---
### 2022.05.12  
- A뷰컨에서 B뷰컨으로 값을 전달할 때는 연결 시점에 전달해야 함. 예를들어 navigationViewController를 push할 때 그 값을 전달해야 함
#### CollectionViewDataSource
- 특정한 셀이 선택되어 있어야 할 때는 `collectionView(_:willDisplay:forItemAt:)`메서드 이용
```swift
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        homePhotoCollectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .top)
    }
```
- 현재 선택된 셀의 indexPath를 구할 때
```swift
    let indexPathTest = homePhotoCollectionView.indexPathsForSelectedItems
    //[indexPath]타입이기 때문에 indexPath.item을 꺼내기 위해서는 서브스크립트 문법 써서 꺼내야 함
    var itemTest = indexPathTest[0].item
```

---
### 2022.05.11
#### UIProgressView
```swift
let progressBar = UIProgressView()
```


- `progress` : 처음 셋팅값
    - 0.5로 셋팅하면 중간정도까지 fill되어 있음

```swift
progressBar.progress = 0.5
```

- `backgroundColor` : progress의 배경색

```swift
progressBar.backgroundColor = MyColor.purpleColor
```

- `progressTintColor` : 채워진 progress 부분을 표시하는 색

```swift
progressBar.progressTintColor = MyColor.yelloColor
```

- `trackTintColor` : 채워지지 않은 progress 부분을 표시하는 색
    - 해당 속성을 설정하면 `backgroundColor`보다 우선 적용됨

```swift
progressBar.trackTintColor = MyColor.greenColor
```

- `setProgress` : 현재 progress를 셋팅하는 값
    - 0.0 ~ 1.0 사이의 값
    - Float 타입이기 때문에 계산시에 주의할 것

```swift
let percentage = Float(secondRemaining) / 20
progressBar.setProgress(Float(percentage), animated: true)
```

### 2022.05.10  
#### NavigationBar 스토리보드 없이 바꾸기
```
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let rootVC = MainViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navigationBarConfiguration(navVC)
        self.window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
    
    private func navigationBarConfiguration(_ controller: UINavigationController) {
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        controller.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        controller.navigationBar.tintColor = .white
        controller.navigationBar.backgroundColor = UIColor.systemBlue
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = UIColor.systemBlue
            controller.navigationBar.standardAppearance = navBarAppearance
            controller.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            controller.edgesForExtendedLayout = []
        }
    }
}
```
---
### 2022.05.09
#### UISegmentedControl
```
let segment = UISegmentControl(items: ["과자", "치킨", "가수"]
segment.selectedSegmentTintColor = .white //선택된 segment 색처리
```
---
### 2022.05.05  
#### Realm에 있는 결과를 홈탭으로 가져오기
- display할 때는 PHFetchResult를 이용하고, realm에 저장시에는 identifier를 이용하다보니 혼동
- realm은 첫 진입 시 한 번만 생성된 후, 이후에는 update 작업만 이루어져야 하는데, 계속해서 렘 생성이 되어 에러 발생
---  
### 2022.05.05  
#### collectionViewCell
- isSelected시 처리 mainImageView에 나오도록
- imageView의 ContentMode에 따라 mainImageView에 어떻게 나오나?
---
### 2022.05.04
#### PhotoKit
- PHFetchOption
---
### 2022.05.03
#### Phokit  
- PHAsset 가져오기
- PHAssetCollection 가져오기
---
### 2022.05.01  
#### closure
- closure에 대한 이해
- @escaping 키워드에 대한 이해
---
### 2022.04.29  
#### MVVM  
- View : 뷰(=viewContoller)에 표시되는 부분
- Model : logic에 관한 부분. Data
- ViewModel : View와 Model을 연결해주는 역할. 예를들어 string을 UILabel로 바꿔줌


---
### 2022.04.27  
#### MVVM 학습
- Model(모델) - ViewModel(뷰모델) - View(뷰=ViewController)
- View와 ViewModel 사이에 Binding(바인딩-연결고리)가 있습니다. ViewModel은 Model에 변화를 주고, ViewModel을 업데이트하는데 이 바인딩으로 인해 View도 업데이트됩니다. ViewModel은 View에 대해 아무것도 모르기 때문에 테스트가 쉽고 바인딩으로 인해 코드 양이 많이 줄어듭니다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f4e36b3d-bd33-4dd5-984d-ffd51c5f1741/Untitled.png)

- In MVVM, you abstract your code to include a **ViewModel, which is a file that holds the values to be presented in your view.**
- The logic we write to format the value (i.e. formatting a string to be inserted into a UILabel) to be presented to the view takes place in the ViewModel.
---
### 2022.04.25
#### Realm
- realm에 저장된 이미지가 다시 홈탭에 표시될 때 문제 해결
- 최초 진입시에는 위에 문제가 다시 발생하는 또 다른 문제 발생
---
### 2022.04.24  
#### Realm  
- realm에 저장된 이미지를 read해서 피커에 표시 O  
- picker에서 새롭게 선택된 사진을 realm에 저장 O  
- 문제) realm에 저장된 사진을 홈탭에 표시할 때 문제 발생  
--- 
### 2022.04.22  
#### Realm  
- Save  
- Read  
---
### 2022.04.21
#### Realm
- Realm Model 구성
- Realm 객체 추가
- Realm 업데이트 실패
---
### 2022.04.20  
#### Realm
- Realm DB의 의미
- Realm Model 만들기 
---
### 2022.04.01
#### AsyncSubject

- source Observable로부터 배출된 마지막 값(만) 배출하고, 소스 Observalbe의 동작이 완료된 후에야 동작
- 소스 Observable이 아무 값도 배출하지 않으면 `AsyncSubjec` 역시 아무 값도 배출하지 않음
- 만약 소스 Observable이 오류로 인해 종료될 경우 `AsyncSubject`는 아무 항목도 배출하지 않고 발생한 오류를 그대로 전달

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5576ab3a-7a6f-49e6-bed2-d845e39db2df/Untitled.png)

#### BehaviorSubject

- 옵저버가 `BehaviorSubject`를 구독하기 시작하면, 옵저버는 소스 Observable이 가장 최근에 발행한 항목(또는 아직 아무 값도 발행되지 않았다면 맨 처음 값이나 기본 값)의 발행을 시작하며 그 이후 소스Observable(들)에 의해 발행된 항목들을 계속 발행
- 만약, 소스 Observable이 오류 때문에 종료되면 `BehaviorSubject`는 아무런 항목도 배출하지 않고 소스 Observable에서 발생한 오류를 그대로 전달

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2043aeef-1002-4b79-8104-5e1a0368f06d/Untitled.png)

#### PublishSubject

- `PublishSubject`는 구독 이후에 소스 Observable(들)이 배출한 항목들만 옵저버에게 배출
- `PublishSubject`는 (이를 막지 않는 이상) 생성 시점에서 즉시 항목들을 배출하기 시작할 것이고 이런 특성 때문에 주제가 생성되는 시점과 옵저버가 이 주제를 구독하기 시작하는 그 사이에 배출되는 항목들을 잃어 버릴 수 있다는 단점이 있음
- 만약, 소스 Observable이 오류 때문에 종료되면 `BehaviorSubject`는 아무런 항목도 배출하지 않고 소스 Observable에서 발생한 오류를 그대로 전달

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2bd088ec-3014-4665-8a68-c00bc512a61d/Untitled.png)

#### ReplaySubject

- `ReplaySubject`는 옵저버가 구독을 시작한 시점과 관계 없이 소스 Observable(들)이 배출한 모든 항목들을 모든 옵저버에게 배출

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/be86b8a7-501a-4c34-8a40-e048a0807c33/Untitled.png)

---
### 2022.03.31
#### Observables 생성하기

- `.just()` : 하나의 요소를 방출하는 옵저버블 생성
    - 하나의 인자만 수용 가능
    - 전달한 인자를 그대로 방출하는 옵저버블이 생성됨
    
    ```swift
    import RxSwift
    
    let disposeBag = DisposeBag()
    let element = "My Dog"
    let observable = Observable.just(element)
    
    let subscription = observable.subscribe(
        onNext: { element in
            print(element)
        }, onCompleted: {
            print("completed")
        })
    
    subscription.disposed(by: disposeBag)
    
    /*
     My Dog
     completed
     */
    ```
    
- `.of()` : 두 개 이상의 요소를 방출하는 옵저버블 생성
    - 두 개 이상의 인자 수용 가능
    
    ```swift
    import RxSwift
    
    let disposeBag = DisposeBag()
    let element1 = "Pizza"
    let element2 = "Chicken"
    let element3 = "Wine"
    let observable = Observable.of(element1, element2, element3)
    
    let subscription = observable.subscribe(
        onNext: { element in
            print(element)
        }, onCompleted: {
            print("completed")
        })
    
    subscription.disposed(by: disposeBag)
    
    /*
     Pizza
     Chicken
     Wine
     completed
     */
    ```
    
    ```swift
    import RxSwift
    
    let disposeBag = DisposeBag()
    let element1 = "Pizza"
    let element2 = "Chicken"
    let element3 = "Wine"
    
    Observable.of(element1, element2, element3)
        .subscribe { element in print(element) }.disposed(by: disposeBag)
    
    /*
     next(Pizza)
     next(Chicken)
     next(Wine)
     completed
     */
    ```
    
- `.just()`와 `.of()`는 인자를 그대로 방출하기 때문에 배열을 전달하면 배열을 방출
- `.from()` : 배열에 저장된 요소를 순차적으로 하나씩 방출하여 옵저버블 생성
    - 배열 또는 시퀀스를 전달받고 배열에 포함된 요소들을 하나씩 순차적으로 방출
    
    ```swift
    import RxSwift
    
    let disposeBag = DisposeBag()
    let food = ["Pizza", "Chicken", "Wine"]
    
    Observable.from(food)
        .subscribe { element in print(element) }.disposed(by: disposeBag)
    
    /*
     next(Pizza)
     next(Chicken)
     next(Wine)
     completed
     */
    ```
    

```swift
import RxSwift

// 옵저버블 생성
let observable = Observable.of(1, 2, 3)

// 구독        
let subscription = observable.subscribe(

        // Next 이벤트 발생 시
        onNext: { element in
        print(element)
        // Completed 이벤트 발생 시
    }, onCompleted: {
        print("completed")
    })

//1, 2, 3
//completed
```

---

#### Dispose

- Observer는 기본적으로 completed 또는 error 이벤트가 발생할 때까지 구독을 유지하지만, dispose 메서드를 사용하면 사용자가 이를 직접 제어할 수도 있음
- Disposable 객체를 반환하면 구독을 취소할 수 있음

```swift
import RxSwift

// 옵저버블 생성
let observable = Observable.of(1, 2, 3)

// 구독        
let subscription = observable.subscribe(
        onNext: { element in
        print(element)
    }, onCompleted: {
        print("completed")
    })

// 구독 취소
subscription.dispose()
```

- 그러나 개별적으로 구독을 관리하다보면 Observable의 수가 많아짐에 따라 관리가 어려워짐
- 이에 따라 RxSwift에서는 DisposeBag을 제공
    - 여러개의 disposable 객체를 모아(Bag) 한 꺼번에 Dispose 가능하도록 함
    - `.disposed(by:)`

```swift
import RxSwift

// 옵저버블 생성
let observable = Observable.of(1, 2, 3)
let disposeBag = DisposeBag()

observable.subscribe(
        onNext: { element in
        print(element)
    }, onCompleted: {
        print("completed")
    }
).disposed(by: disposeBag) // 한 꺼번에 구독 취소

/*
1
2
3
completed
*/
```

---
### 2022.03.30  
#### RxSwift
#### Observables  
- 이벤트를 시간의 흐름에 따라 전달하는 전달자  
- 비동기로 동작하는 일련의 항목들을 나타내는 시퀀스  
- 세 가지의 이벤트를 방출하게 됨  
    - `next` : 다음 데이터를 가지고 옴. 그러면 Observer가 데이터를 받음  
    - `completed` : 시퀀스를 성공적으로 끝냄. (더 이상의 이벤트 배출X)  
        - 옵저버블 라이프 사이클 중 가장 마지막에 전달  
        - 오류가 발생하지 않았다면 Observable은 마지막 `onNext`를 호출한 후 이 메서드를 호출  
    - `error` : 오류로 인한 종료. (더 이상의 이벤트 배출X)  
        - 옵저버블 라이프 사이클 중 가장 마지막에 전달  
        - completed와 동시에 배출될 순 없음  
- 항목(next/completed/error)을 배출하지 않을 수도 있음  
    - 아무 항목(=알림=이벤트)을 배출하지 않거나 completed 또는 error만 배출할 수도 있으며 next만 배출할 수도 있음  
- Observable의 종료  
    - Observable이 `OnCompleted`나 `OnError` 알림을 발행하면 Observable은 자원을 반환하거나 실행을 종료 시키고, 이때 옵저버는 더 이상 Observable과의 커뮤니케이션을 시도하면 안됨  
    - Observable은 종료 전에 Observable을 구독 중인 모든 구독자에게 `OnCompleted`나 `OnError` 알림을 중 하나를 꼭 보내야 함  
#### Observer  

- Observable을 감시(subscribe)하고 있다가 Observable이 이벤트를 방출(emission)하면 전달받은 이벤트에 반응/처리  
- 아래의 알림들을 통해 Observable과 커뮤니케이션 함  
    - Subscribe : 옵저버가 Observable로부터 알림을 받을 준비가 되었음  
    - Unsubscribe : 옵저버가 Observable로부터 알림을 받고 싶지 않음  
- 옵저버가 Observable에게 Unsubsribe 알림을 보내면, Observable은 더 이상 옵저버에게 알림을 보내지 않지만, 옵저버가 Unsubscribe 알림을 보낸 후라 해도 구독 해지는 보장되지 않을 수 있음  
- Observable이 OnError나 OnCompleted를 옵저버에게 보내면 구독은 종료. 이 경우, 옵저버는 더 이상 구독을 해지하기 위해 Observable에게 Unsubscribe 알림을 보낼 필요가 없음  
---
### 2022.03.05  
#### 데이터 저장 방법   
##### UserDefaults  
- 작은 데이터를 빠르게 유지 가능 (key-value 짝)  
- 예) 사용자의 최고 점수, 플레이어의 닉네임, 음악 켜기/끄기 등  
##### Codable protocol  
- 사용자 지정 객체가 포함된 많은 개별 plist를 저장할 수 있음  
- custom objects을 plist에 고정한 다음 사용할 때 전체의 plist를 검색하거나 전체의 plist를 메모리로 로드해야만 plist에 포함된 항목이나 개체를 사용할 수 있음  
- 테이블 안에 1~2개의 항목만 넣고 싶을 때 테이블 전체를 로드하는 것은 memory intensive(메모리 집약적) → 작은 데이터에만 사용되어야 함 (100KB 이하)  
##### Keychain  
- 테이블 안에 작은 데이터를 안전하게 저장할 수 있는 방법  
- 애플이 안전하게 저장할 수 있도록 도와줌  
- 예) 사용자 이름, 비밀번호 등  
##### SQLite  
- 장치에 데이터를 저장하는 대부분의 아이폰 앱, 백엔드 또는 데이터베이스는 대부분 SQLite를 사용  
- 가볍고 사용하기 쉬운 관계형 데이터베이스  
- 대량의 데이터를 보존할 수 있도록 설계되었으며 데이터를 쿼리할 수 있는 효율적인 방법이 내장  
- codable protocol처럼 전체의 plist를 가져오는 게 아니기 때문에 메모리에 부담 없음  
##### Core Data  
- database로 SQLite를 사용  
- 개별적인 테이블들을 데이터 베이스의 객체로 변환할 수 있고, 코드를 이용하여 쉽게 그 객체들을 조작(manipulate)할 수 있기 때문에 → 단지 database라고 부르기엔 기능이 더 많음  
- 보다 자연스러운 언어를 사용하여 데이터베이스를 query할 수 있는 효율적인 방법을 제공  
- SQLite가 할 수 없는 많은 작업을 수행  
    - 예) 데이터베이스의 변경 모니터링  
- 기본적인 기능은 만들고, 읽고, 업데이트하고, 파괴하는 것(destroy)
- 데이터를 처음부터 보내야 한다면, core data가 좋은 선택일 것  
##### Realm  
- 오픈 소스 프레임워크  
- Core Data보다 훨씬 빠르고 쉬운 데이터 베이트 솔루션이며, 기기에 데이터를 유지시키는 가장 popluar ways가 되고 있음  
---
### 2022.03.04  
- App LifeCycle 2  
---  
### 2022.03.03  
- App LifeCycle  
---  
### 2021.12.19  
- git에 대한 이해  
---
### 2021.08.13  
-Split View Controller  
-Customizing Split View Controller  
- Git Test
---
2021.08.12  
-Customizing Tab Bar Controller  
----------
2021.08.11  
-Customizing Navigation Controller  
-Navigation Controller Toolbar  
-Tab Bar Controller  
------------
2021.08.10  
-Container View Controller  
-Navigation View Controller  
-Navigation Item and Navigation Bar  
-Customizing Navigation Controller  
-------
2021.08.09  
-ViewController Overview  
-View Contorller Management  
-View Controller Life Cycle  
-Orientation and Rotation  
--------
2021.08.08  
-Managing the Seletion  
-Edit Rows and Sections  
-Reordering Items  
-Cell Prefetching & Data Prefetching  
----
2021.08.07  
-Supplement Cell  
--------
2021.08.06  
-Collection View Cell  
-Supplement View  
--------
2021.08.05  
-CollectionView OverView  
-Flow Layout  
-TableView 복습  
  (1) Table View Basics  
  (2) Multi Section  
  (3) Seperator  
  (4) Table View Cell  
  -----------
2021.08.04  
-Swipe Action  
-Reordering Cells  
-Prefetching API  
-Table View Controller & Static Cells  
-Table View 강의 빠르게 돌려보기  
-------
2021.08.03  
-Managing Selection #1 ~ #2  
-Edit Mode #1 ~ #2  
-Row Action  
--------
2021.08.02  
-Customizing Section #1 ~#2  
-Section Index Title  
-Table Header Veiw & Footer View  
--------
-2021.08.01  
-Standard Accessory View  
-Custom Accessory View  
-Self Sizing  
-Custom Cell #1  
-Custom Cell #2  
---------
2021.07.31  
-Multi Section #1  
-Multi Section #2  
-Separator  
-Table View Cell  
--------------
2021.07.30  
-Table View Overview  
-Table View Basics  
--------
2021.07.29  
-DateFormatter  
-ISO8601DateFormatter  
-----------
2021.07.28  
-Library 관리자 : 스냅킷(오토레이아웃 통달한 후, 배우기!), 코코아팟, Apple Developer Package  
-객체지향 프로그래밍 요소 : 캡슐화, 상속성, 다형성, 추상화, 은닉화  
-App의 Life Cycle : Not running->forground(active->inactive)->background->suspended->Not running  
-ViewCotroller Life cycle  
  viewdidload : 뷰가 메모리에 올라갔을 때  
  viewwillappear  
  viewdidappear : appearing→appeared  
  viewwillidisappear  
  viewdiddisappear  
------------------
2021.07.27  
-Canlendar and Date Components  
-Date Picker  
-Countdown Timer  
2021.07.26  
-Input View & Input Accessory View  
-Password AutoFill #1 ~ #2 (유료계정 필요)  
-Date
2021.07.25  
-SoftWare Keyboard #1 ~ #2  
-Text Delegate #1 ~ #3  
2021.07.24  
-Text View #1 ~ #3  
-Text Input #1 ~ #2  
---------
2021.07.22  
-Color #1, Color #2  
-Label #1 ~ #2  
-Text Field #1 ~ #3  
[단축키]  
-Shift command L : Library 단축키  
-command B : Build  
-command R : Run  
-control I : 줄 맞춤?  
-command 0 : 네비게이터 열기  
-control + command 함수클릭 : 함수 정의(?) 보기  
-xcode의 자동 완성 기능 : option + esc  
-command Delete :  문장 지우기  
-control Delete : 끊어서 지우기(대소문자 구별)   
-option Delete : 단어 지우기  
-command L 숫자 : line number 검색  
-command shift O : Open Quickly  
-command option [ : 위로 올라가기  
-command option ] : 아래로 내려가기  
-command 0 : 네비게이터 열고 닫기  
-command option 0 : indicator 닫기  
-command option W : 해당 탭 빼고 다 닫기  
-자동정렬 : control I  
-command , : 설정 단축키 (딜리트 라인 설정)  
-이름 다 바꾸기 : command 클릭 rename  
-control shift 화살표 (커서 늘리기) : 똑같은 거 추가하기  
-command L : 주소창  
-----------------
2021.07.21  
-Delegate & DataSource  
-----------------
2021.07.20  
-Image View  
-Image View #Image Basics  
-Image View #Resizable Images & vector Images  
-Image View #Template Images  
-Image View #Custom Drawing and Resizing  
-------------
2021.07.19  
-Switch  
-Stepper  
-Activity Indicator View  
-Progress View  
-Alert Controller #1~#3  
--------------
2021.07.18  
-Slider #1  
-Slider #2  
-------------
2021.07.17  
Slider  
-----------
2021.07.16  
Delegate Pattern #2
-------------
2021.07.15  
-Button#2  
-Picker View #1, Picker View #2  
-Page Control  
-Delegate pattern #1 복습  
------------------
2021.07.14  
-Overview  
-View & Windows : UIView #1 ~ #4  
-System View & Control : UIControl, Target Action, Button#1  
---------------
2021.07.13  
-Hello, iOS project  
-Hello, Xcode12  
-Hello, interface Builder  
-Outlet and Action  
-Delegate Pattern #1  
----------
2021.07.12  
-property(Stored property, Computed property, Type property, property Observer)  
-foreach, map 고차함수  
----------

2021.07.11  
-subscript requirements(재복습 필요)  
-Memory Basics  
-Value Type vs Reference Type  
-ARC(Automatic Reference Counting)  
-Strong Reference Cycle  
----------
2021.07.10  
-복습  
1)구조체, 클래스  
2)property, method, intitializer  
3)inheritance  
4)extension(재복습 필요)  
-method requirements(재복습 필요)  
-initializer requirements(재복습 필요)  
----------
2021.07.09  
-Adding Initializer  
-Adding Subscripts  
-Protocol : 형식에서 제공하는 멤버 목록. 멤버를 선언해야 함. 실제의 멤버 구현은 구조체, 클래스에서 하게 됨  
-Property Requirements  
    protocol ProtocolName {  
        var name: Tyep { get set }  
        static var name: Type { get set }  
}  
----------

2021.07.08  
-Initializer delegation : initializer위임을 통해 에러를 줄이고, 디버깅을 편리하게  
-Failable initializer : initializer의 옵셔널 버전. 초기화에 실패해도 nil값이 리턴될 수 있도록  
-Deinitializer : initializer 정리작업. 자동으로 제거가 되나, 부가적인 정리작업을 위해 사용  
-Extension : 형식 확장  
    computedProperty  
    computedTypeProperty  
    instanceMethod  
    typeMethod  
    initializer  
    subscript  
    NestedType  
    위에서 확장 가능  
-Adding properties  
-Adding Methods  
----------
2021.07.07  
-Initializer : 모든 속성은 기본값을 가지고 있어야 한다.  
    init(parameters) {  
    initialization  
    }  
-memberwise Initializer : 구조체가 자동으로 제공하는 initializer  
-Class Initializer : Designated Initializer vs convenience Initializer  
    Designated Initializer : 클래스가 가진 모든 속성 초기화  
    convenience Initializer : 필요한 것만 초기화  
-Requaired Initializer : subclass에서 SuperClass에서 initializer를 직접 구현하도록 강제하는 것  
----------
2021.07.06  
-Inheritance  
    class className: SuperClassName {  
    }  
-Overriding : SuperClass의 멤버가 적합하지 않다면 직접 재정의하여 구현  
-Upcasting : subclass instance를 superclass 형식으로 저장하는 것  
-Downcasting : Upcasting된 형식으로 원래 형식으로 되돌리는 것  
-Any & AnyObject : 범용자료형. 모든 형식으로 저장을 가능하게 해주는 마법 단어  
-Type Casting Pattern  
-Overloading : 하나의 형식에서 동일한 이름을 가진 다수의 멤버를 선언할 때. 파라미터 수/파라미터 자료형/Argument Label/return 형으로 식별  
----------
2021.07.05  
-Instance Method : 클래스, 구조체, 열거형에서 사용  
func name(parameters) -> ReturnType {  
    Code  
}  
instance.method(parameters)  
-Type Method : 클래스, 구조체, 열거형에서 사용  
static func name(parameters) -> ReturnType {  
    statements  
}  
Type.method(parameters)  
-Subscript  
subcript(parameters) -> ReturnType {  
    get {  
        return expression  
        }  
        set {  
        statements  
        }  
}  
----------
2021.07.04  
-property 복습  
----------
2021.07.03  
-Stored Property  
var name: Type = dafaultName  
let name: Type = defaultName  
lazy var name: Type = DefaultValue  
-Computed Property  
var name: Type {  
    get {  
        statements  
        return expr  
    }  
    set(name) {  
        statements  
    }  
}  
-Property Observer  
var name: Type {  
    willSet(name) {  
        statements  
    }  
    didSet(name) {  
        statements  
    }  
}  
-Type Property  
static var name: Type = DefaultValue  
static let name: Type = DefaultValue  
-self & super  
self  
self.propery  
self.method()  
self[index]  
self.init(parameters)  
----------
2021.07.02  
-Structures and Classes : syntax  
struct/class Name {  
property  
method  
initializer  
subscript  
}  
-Initializer : syntax  
init (parameters) {  
statements  
}  
-Nested Types : syntax(String.CompareOptions)  
----------
2021.07.01  
Dictionary : Comparing , Finding  
Set : Inspecting, Testing, Adding, Removing, Comparing, Combining
Iterating Collections : foreach  
Enumeration : syntax, Raw Values  
----------
2021.06.30  
Array : Creating Array, Adding Array, removing Array   
Dictionary : Creating Keys and Values, Inspecting Keys and Values, Accessing Keys and Values, Adding Keys and Values, removing Keys and Values  
----------
2021.06.29  
String searching : range(of:), common  
String Comparison : compare, prefix, suffix, hasPrefix, hasSuffix  
String Options : Case Insensitive Option, Literal, Backward  
----------
2021.06.28  
String basic  
Appending Strings and Characters : ed/ing 값은 원본을 바꾸지 않음.  
Inserting Characters : contentsof  
Replacing Substrings : replaceSubrange, replacingCharacters, replacingOccurences  
Removing Substrings : remove, removeFirst, removeLast, removeSubrange, removeALL, drop  
----------
2021.06.27  
String Index  
Stiring basics  
----------
2021.06.26  
String and Character  
Multiline String Literals : """사용하여  여러 줄 문자열 사용"""  
String Interpolation : 문자열의 포맷을 지정하는 것. %을 통해 포맷 지정  
String indices : 특정 문자의 인덱스만 불러들임.  
----------
2021.06.25  
Tuple  
: 이름없는 튜플. (expr1, expr2, ...)  
Named Tuple  
: 이름을 가진 튜플. 가독성이 높아짐.  
----------
2021.06.24  
Autoclosure  
Tuples  
Named Tuples  
----------
2021.06.23  
----------
2021.06.21  
#Optionals, Function  
#IUO, Nil-Coalescing Operator  
----------
2021.06.17  
#Optionals, Functions  
#Optionals : 값을 가지지 않아도 되는 형식  
Optional Binding : Optionals를 강제 언래핑하는 것  
Return Functions  
func name(parameters) -> returnType {
statements  
}  
----------
2021.06.16  
Control Transfer Statements, Labeled Statements  
Control Transfer Statements : 제어전달문. 흐름제어구문.   조건문과 반복문에서 일반적인 코드의 흐름을 바꾸기 위해 사용  
break Statement : 현재 실행 중인 문장을 중지하고 다음 문장을 실행  
Continue Statement : continue는 현재 실행중인 반복을 중지하고 다음 반복을 실행한다.   
Labeled Statemetn  
Label: statement  
break Label  
continue Label  
----------
2021.06.14  
1. Token  
-가장 작은 요소  
-공백이나 구둣점으로 나눌 수 없는 요소 . 예) if  
2.Expression  
-값, 연산자, 함수 등이 하나 이상 모여 하나의 값으로 표현된 것. 토큰이 하나 이상 모인 것 
-표현식을 평가한다(evaluate)=코드를 실행하여 값을 얻는다  
3. Statement  
-하나 이상의 표현들이 모여서 특정 코드를 작성. 표현식이 하나 이상 모인 것  
-예) if, switch, guard, for-in, while  
4. Compile  
-X-code에서 작업한 텍스트를 컴퓨터가 이해할 수 있도록 바꾸는 것  
-변환에 필요한 것들은 x-code에 내장되어 있음(Compiler)  
5. Link  
-컴파일한 파일을 라이브러리, 프레임워크와 연결시키는 것  
-연결시키는 것들 또한 x-code에 내장되어 있음(Linker)  
6. Run  
-실행해보는 것  
-디버그 모드 : 파일은 커지지만, 오류를 쉽게 찾을 수 있음  
-릴리즈 모드 : 파일 작업, 앱스토어 앱 올릴 때 사용  
-Runtime : 컴파일된 코드를 실행해보는 것  
7. Characters  
! : Exclamation Mark  
~ : Tilde  
[ ] : Square Bracket  
{ } : Curly Bracket / Brace  
< > : Angle Bracket  
8. First Class Citizen  
상수와 변수로 저장할 수 있다.  
parameter로 전달할 수 있다.  
함수에서 리턴할 수 있다.  

2.Working with Variables
[var]
var variableName = initialValue
variableName = initialValue

var name = "Swift"
var year = 2018
var valid = true


var x = 0.0, y = 0.0, z = 0.0

name
print(name)

year
print(year)

x
print(x)v

name = "Steve" //이미 선언한 변수는 바꿀 수 있다. 그러나 var name으로 재선언할 수는 없다.
name = "Yoona"
print(name) //변수에는 값이 누적되지 않고, 가장 최근의 값이 나옴

var anotherName = name //이 시점에서는 name과 anotherName이 값이 같아짐

anotherName = "Tim" //anotherName에 다른 값을 넣으면?
print(name, anotherName) //원래의 변수의 값을 변경시키지는 않고, 자기것만 변경시킴

//문자열 타입을 정수열 타입에 저장할 수 없음. year = "2018"은 불가능. 정수만 저장할 수 있음


[let]
let constantName = initialValue

//상수. 변수와 문법적으로 유사하지만 값을 저장한 후에는 변경할 수 없음

let name = "Yoona"

name
//let은 한 번 저장후에 변경이 불가능이 하기 때문에 let = "Steve" 안됨.
//특징을 변경할 수 없음. 변수를 정수로 선언해놓고, 문자열을 저장할 수 없음.

//변수보다는 상수를 선호함. 1)실수 발생확률이 적기 때문에 2)상수의 컴파일이 더 빨리 됨.

[Naming Convention]
Camel Case
1)UpperCamelCase : 시작 문자를 모두 대문자
-Class
-Structure
-Enumeration
-protocol

2)lowerCamelCase : 시작 문자는 소문자
-Variable
-Constant
-Function
-Property
-Method
-Parameter

[Scope : {}로 구분함]
-Global Scope : 전역범위. 어떤 {}에도 속하지 않음.  단 하나만 존재
-Local Scope : 지역범위. {} 내에 속함. 여러개 존재할 수 있고 중첩도 가능(네스티드 스코프로 부르기도 함)


3.Data Types with Memory
자료의 유형
-Integer Types : 정수 
-Floating-Types
-Boolean Types
-Character Types : 하나의 문자
-String Types : 하나 이상의 문자 

[Memory]
실수를 저장할 때는 지수와 가수를 나눠서 저장한다.
동일한 메모리 범위에서 정수보다 더 넓은 범위를 표현할 수 있다.
부동소수점 오차로 인해서 100% 정확한 소수를 저장할 수 없다.
메모리 저장 가능한 값보다 큰 값을 저장하면 overflow가 발생한다. (swift만)


4.Literals, Data Types
[Integer]
//정수 자료형
//Int8 = 1byte 저장가능
//Int16 = 2byte 저장가능
//Int32 = 4byte 저장가능
//Int64 = 8byte 저장가능

Int8.min
Int8.max
Int16.min
Int16.max
Int32.min
Int32.max
Int64.min
Int64.max

MemoryLayout<Int8>.size

<Signed vs Unsigned>
//Unsigned는 부호가 없는 것
Int8.min >> -128
Int8.max >> 127
UInt8.min >> 0
UInt8.max >>256 //unsigned에서는 양수 부분만 사용

MemoryLayout<Int>.size >>8
Int.min
Int.max

let num = 123 //자동으로 상수로 인식
type(of: num) //상수로 인식된 것을 알 수 있음.

[number]
1,000 -> 1_000로 써야함

[Floating]
실수자료형
Floating자료형은 6자리까지 정확하게 처리
Double자료형은 16자리까지 정확하게 처리
기본적으로 타입을 규정하지 않으면 Double로 인식
Int보다 더 많은 수를 저장할 수 있기 때문에 오류가 적다.


[Boolean]

let isVaild: Bool = true //대소문자 구별하기 때문에 True는 오류가 남. true와 false만 사용가능

let str = ""
str.isEmpty >>true


[Strings and Characters]
//문자열은 큰 따옴표 안에 있어야 함
"Have a nice day"
"123" //숫자로 표현되어 있지만 문자열

let str = "1"
type(of: str) >>String
———
let ch: Character = "1"
type(of: ch) >> Character

//let doubleCh: Character = "AA" 문자가 2개 이상일 때는 무조건 String. Character될 수 없음

let emptyCh: Character = " " //공백을 넣고 싶을 때는 ""가 아니라 " "로 해야한다.


[Type inference]
let num = 123
type(of: num)
//형식추론. 따로 형식을 정하지 않아도 추론하여 형식 부여. 가장 오류가 없는 형식으로 추론됨.

let temp = 11.2
type(of: temp)

let str = "Swift"
type(of: str)

let a = true
let b = false
type(of: a)
type(of: b)

//let value
//type(of: value) 오류 발생. 추론을 해야하는데 초기값이 없기 때문에 추론을 할 수가 없음. 직접 자료형을 지정해야 함



[Type Annotation]
//자료형을 직접 지정하는 것
let num: Int = 123 //123이 초기값임

let value: Double
value = 12.3 //위에서는 상수 선언만 하고 다음에 초기화해도 됨.

//왜? 자동으로 되는데, 굳이 type annotation해야하는 가?
//1) 다른 타입형으로 저장하고 싶을 때
//2) 엄청 큰 프로젝트일 때는 지정하지 않으면 컴파일에 큰 시간 소요가 큼

let ch: Character = "c"


[Type Conversion]
//Type Conversion : 메모리에 저장된 값을 다른 형식으로 바꿔 새로운 값을 형성
//Type Casting : 메모리에 저장된 값을 그대로 두고 컴파일러가 다른 형식으로 처리하도록 지시

let a = 123
let b = 4.56
//a + b 오류. 서로 다른 형식이기 때문에 안됨.

Double(a) + b // 123.0 + 4.56
a + Int(b) // 123 + 4

let c = Int8(a)

let d = Int.max
//let e = int8(d)


//let str = "123"
//let num = Int(str)

let str = "number"
let numb = Int(str)

[Type Safety]
//let str: String = 123 문자열에 정수 저장 불가능. 반대도 마찬가지로 불가능. 오류 발생
//let num: Int = 12.34 오류 발생. 정수와 실수도 엄격히 구분함

//let a = 7
//let b: Int8 = a 오류발생. 하나(Int)는 1바이트, 하나는 8바이트(Int8)로 값의 유실 문제로 호환되지 않음

//자료형의 이름이 다르다면 호환되지 않음. 서로 다른 자료형의 값을 저장하려면? type conversion 문법 사용하면 됨

//계산식에도 동일하게 적용됨
let a = 123
let b = 34.56
//let result = a + b 오류발생. 서로 다른 타입의 유형의 값을 저장할 수 없음.

//연산에서도 마찬가지. 서로 같은 유형일 때만 연산이 가능
//let rate = 1.94
//let amt = 10_000_000
//let result = rate * amt 오류 발생. rate실수고 amt는 정수이므로.

let rate = 1.94
let amt = 10_000_000
let result = rate * Double(amt)
type(of: result)

//위 코드를 다시 정수로 계산하는 방법은? 1)Int로 바꿔서 계산 2)나온 Double값을 Int로 변환

Int(rate * Double(amt)) //2)나온 Double값을 Int로 변환
Int(rate) * amt //1)Int로 바꿔서 계산

[Typealias]
typealias Coordinate = Double

let lat: Coordinate = 12.34
let Ion: Coordinate = 56.78

//Double이라는 형식을 새로운 이름(여기서는 Coordinator)로 정의하여 그것을 Double 대신 사용.

5.Operator
[연산자]
단항 연산자 : +a
이항 연산자 : a✅+✅b
삼항 연산자 : a✅?✅b✅:✅c

전치 연산자(prefix operator) : 피연산자 뒤에
후치 연산자(postfix operator) : 피연산자 앞에
(infix operator) : 피연산자 중간에 a+b

[단항 연산자]
let a = 12
let b = 34

+a
+b

//효용성이 전혀 없기 때문에 현실적으로 사용할 일은 적다.

[Additional Operator]
더하기 연산자

[Unary minus Operator]
-a //단항 연산자로 사용할 때는 부호만 -로 바꿔줌

[Subtraction Operator]
a - b

[Multiplication Operator]
a * b

[Division Operator]
a / b >> o
b / a >> 2

let c = Double(a) 
let d = Double(b) 

c / d >> 0.3524~~
d / c >> 0.2888888888835~~

//나누기 연산자는 몫을 나타내고, 정수 연산자와 실수 연산자를 모두 지원한다.

[Remainder Operator]
//나머지 연산자. 정수만 지원. 실수를 나누고 싶을 때는 truncatingRemainder method를 사용해야 함

a % b
//c % d

c.truncatingRemainder(dividingBy: d) //실수의 나머지 연산자를 사용할 때는 반드시 이렇게.

[Overflow]
let num: Int8 = 9 * 9
//let num: Int8 = 9 * 9 * 9 오류. 이처럼 자료형의 저장할 수 있는 값의 범위를 벗어난 것을 Overflow라고 함

let num2: Int = 9 * 9 * 9
//Overflow문제를 막기 위해 가능한 한 크게 타입을 정하거나, 미리 값을 예측해 타입을 부여하는 게 좋음.

[Overflow Operator]
Int8.min >>-127
Int8.max >>128

let num:Int8 = Int8.max >>128
//let num:Int8 = Int8.max + 1 오류. Int8에 들어가는 값(127)보다 커서 Overflow 문제 발생


[Overflow Addition Operator]
a &+ b
let a: Int8 = Int8.max
let b: Int8 = a &+ 1 // 가장 큰 값에 +1을 하면 가장 작은 값이 됨.


[Overflow Subtraction Operator]
a &- b
let c: Int8 = Int8.min
let d: Int8 = c &- 1 //Overflow가 허용된다고 해서 -129가 되지는 않음. 메모리 크기가 변경되는 게 아니라 비트가 바뀌는 것

[Overflow Multiplikation Operator]
a &* b
let e: Int8 = Int8.max &* 2 //지금은 이해할 필요 없음


[Comparison Operator]
//비교 연산자(비교이므로 이항 연산자임). 비교한 조건이 맞다면 true, 틀리면 false. 비교 연산자의 결과는 항상 Boolean.

let a = 12
let b = 34

[Equal to Operator]
a == b
//두 값이 같은지 비교. 값이 같다면 true가, 다르면 false가 return됨
a == b >>false

"Swift" == "Swift" >>true
"swift" == "Swift" //오류. Swift는 대소문자를 구별하기 때문에

//정수와 실수 비교
let c = 12.34
//a == c 오류. 산술 연산자와 마찬가지로 같은 자료형만 비교가 가능.

[Not equal to Operator]
a =! b
a != b >>true. 두 값이 다르기 때문에.

[Greater than Operator]
a > b 
a > b >> true
"swift" > "Swift" >>true. //비교 연산자로 문자를 비교할 때는 유니코드나 아스키코드의 값을 비교함. 아스키코드(?)상 대문자보다 소문자s가 더 큼

[Greater than or equal to Operator]
a >= b
a >= b >>false
7 > 7 >> false
7 >= 7 >>true

[Less than Operator]
a < b
a < b >>true

[Less than or equal to Operator]
a <= b
a <= b >>ture

[Ternary Conditional Operator]
condition ? expr1 : expr2

//condition(boolean이어야 함) 값이 true면 expr1값이, false면 expr2 값이 도출됨. expr1과 expr2의 자료형이 같아야 함.
let hour = 12

hour < 12 ? "오전" : "오후" >> 오후
//if문으로도 표현가능
if hour < 12 {
    "am"

} else {
    "pm"
}

[Assignment Operator]
a = b
//할당 연산자. 값을 저장하는 역할. 비교연산자와 헷갈리지 말것.
// lvalue
// rvalue
// lvalue는 할당 연산자 양 쪽에 둘 다 올 수 있지만, rvalue는 항상 오른쪽에 와야 함.


[Compaound Assignment Operator]
복합할당 연산자

1. Addition Assignment Operator
    a += b
    a = a + b 

    var a = 1
    var b = 2
    a = a + b >> 5

2. Subtraction Assignment Operator 
    a -= b
    a = a - b

    var c = 31
    var d = 15
    e -= f >>16
    print(e) >> 16

3. Multiplication Assignment Operator 
    a *= b
    a = a * b

    var e = 3
    var f = 5
    e *= f >> 15
    print(e) >>15

4. Modulo Assignment Operator 
    a %= b
    a = a % b


[Range Operator]
1. Closed Range Operator 
    a … b
    a… (피연산자 하나일 때는 떼지 않고 쓰기)
    …b
    
    var sum = 0
    for num in 1 ... 10 {
        num
        sum += num
    }
    sum >> 55. 10번 반복하여 1~10까지 더함


    let list = ["A", "B", "C", "D", "E"]
    list[2...] >> "C", "D", "E"
    list[...0] >> “A”
    목록이 정확하게 있는 것들은 이 연산자를 통해 정확하게 불러낼 수 있음.

2. Half-Open Range Operator 
    a ..< b
    ..<a

    sum = 0
    for num in 1 ..< 10 {
        sum += num
    }

    sum >> 45 // upperBound가 9이므로 9까지만 더함

    print(list) >> “A”, “B”, “C”, “D”, “E”
    list >> “A”, “B”, “C”, “D”, “E”
    list[..<2] >> “A”, “B” //list에서는 모든 값이 고정되어 있음.


    let range = 0 ... 5
    range.contains(7) >> false
    range.contains(1) >> true

    let ran = ...7
    ran.contains(9) >>false
    ran.contains(3) >>true
    ran.contains(-1) // 단항 연산자를 사용할 때는 loweBound가 자동 지정되지 않기 때문에,         lowerBound는 무한대가 됨.
    ran.contains(Int.min) >> true

