//
//  MapView.swift
//  togeduck
//
//  Created by Yoonjae on 2022/04/08.
//

import SwiftUI
import SwiftUIFlowLayout
import MapKit

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    
    @State var hobbyNum : Int = 0
    var member: Member
    
    var body: some View {
        
        VStack {
            
            ProfileHobbyButton(hobbyNum: $hobbyNum, member:member)
            
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemPink))
                .onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                }
            
            Text("주변에 \(member.hobbies[hobbyNum].hobbyPost.count)명의 친구들이 활동 중이에요.")
                .padding()
            
            NavigationLink(destination: BottomTabView(), label: {
                Text("시작하기")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            })
        }
        .navigationBarTitle("지역 설정", displayMode: .inline)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(member: members[0])
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManage : CLLocationManager?
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.014330, longitude: 129.325761), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManage = CLLocationManager()
            locationManage!.delegate = self
        } else {
            print("위치를 탐색할수 없습니다.")
        }
    }
    private func checkLocationAuthorization() {
        guard let locationManager = locationManage else {
            return
        }
        switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("현재 위치는 파악하기에 제한적입니다.")
            case .denied:
                print("위치 추적을 차단한 상태입니다. 셋팅으로 가서 바꾸어 주세요.")
            case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            @unknown default:
                break
            
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
