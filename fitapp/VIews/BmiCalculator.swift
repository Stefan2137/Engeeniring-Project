import SwiftUI

struct BmiCalculator: View {
    @State private var weight = 0.0
    @State private var height = 0
    @State private var bmi = 0.0

    private func calculateBMI() -> Double {
        guard height > 0, weight > 0 else {
            
            return 0.0
        }

        let heightInMeters = Double(height) / 100
        return weight / (heightInMeters * heightInMeters)
    }

    var body: some View {
        VStack {
            Text("BMI Calculator")
                .offset(x: -10 ,y:-20)
            HStack {
                TextField("Weight", value: $weight, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100, height: 40)
                Text("KG")
            }

            HStack {
                TextField("Height", value: $height, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100, height: 40)
                Text("Height in CM")
            }
            .offset(x: 39, y: -0)

            TLButton(title: "Calculate", background: .blue, titlebackground: .white) {
                bmi = calculateBMI()
            }
            .frame(width: 300, height: 40)

            Text("BMI: \(String(format: "%.2f", bmi))")
        }
        .padding()
    }
}

struct BmiCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        BmiCalculator()
    }
}
