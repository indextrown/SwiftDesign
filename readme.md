# SwiftUI 5.0 Cheat Sheet

![SwiftUI](./assets/swift-ui-logo.png)

# View

### Text

To show a **text** in UI simply write:  
UI에 **텍스트**를 표시하려면 다음과 같이 작성하세요:
``` swift
Text("Hello World")
```

### MapKit

MapKit을 통해 지도 출력:  
``` swift
import SwiftUI
import MapKit

struct MapView: View {
    // 초기 위치 설정하는 MKCoordinateRegion
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)  // 지역(region)을 바인딩
            .ignoresSafeArea()          // 전체 화면을 지도로 채우기
    }
}

#Preview {
    MapView()
}
```
