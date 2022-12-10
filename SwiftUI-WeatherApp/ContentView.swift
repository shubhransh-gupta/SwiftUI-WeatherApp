//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Shubhransh Gupta on 10/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNightMode: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(startColor: isNightMode ? .black : .blue, endColor: isNightMode ? .gray : Color("lightBlue"))

            VStack {
                Text("Bengaluru, IN")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: isNightMode ? "moon.stars.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 190, height: 190)
                    Text("21° C")
                        .font(.system(size: 60, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                }
                
                HStack(alignment: .firstTextBaseline, spacing: 8){
                    weather(day: "SUN", imageName: "sun.max.fill", temperature: "24°C")
                    weather(day: "MON", imageName: "cloud.drizzle.fill", temperature: "18°C")
                    weather(day: "TUE", imageName: "cloud.sun.fill", temperature: "21°C")
                    weather(day: "WED", imageName: "snow", temperature: "12°C")
                    weather(day: "THU", imageName: "sunrise.fill", temperature: "21°C")
                    Spacer()
                }
            Spacer()
                Button { isNightMode.toggle() }
                label: {
                    Text(isNightMode ? "Change to Day Mode" : "Change to Night Mode")
                        .frame(width: 280, height: 50)
                        .foregroundColor(.blue)
                        .font(.system(size:21,  weight: .medium))
                        .background(Color.white)
                        .cornerRadius(10)
                        
                }.padding()
                Spacer()
            }
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider  {
    static var previews: some View {
        ContentView()
    }
}

@ViewBuilder
private func weather(day: String, imageName: String, temperature: String) -> some View {
    VStack {
        Text(day)
            .font(.system(size: 16, weight: .medium, design: .default))
            .foregroundColor(.white)
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
        Text(temperature)
            .font(.system(size: 18, weight: .medium, design: .default))
            .foregroundColor(.white)
        Spacer(minLength: 50)
    }.padding()
}
 
struct BackgroundView : View {
    
    var startColor: Color
    var endColor: Color
    
    var body : some View {
        LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
    }
}
