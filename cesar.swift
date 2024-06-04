
// import Swift

// func caesarCipher(_ text: String, shift: Int) -> String {
//     var result = ""
    
//     for character in text {
//         var shiftedCharacter = character
//         if let scalar = UnicodeScalar(String(character)) {
//             let unicodeValue = Int(scalar.value)
//             var shiftedValue = unicodeValue
            
//             // Verificar si el carácter es una letra
//             if CharacterSet.letters.contains(scalar) {
//                 let isUppercase = CharacterSet.uppercaseLetters.contains(scalar)
//                 let unicodeA = isUppercase ? Int(UnicodeScalar("A").value) : Int(UnicodeScalar("a").value)
//                 shiftedValue -= unicodeA
//                 shiftedValue = (shiftedValue + shift) % 26
//                 if shiftedValue < 0 {
//                     shiftedValue += 26
//                 }
//                 shiftedValue += unicodeA
//                 shiftedCharacter = Character(UnicodeScalar(shiftedValue)!)
//             }
//         }
//         result.append(shiftedCharacter)
//     }
    
//     return result
// }

// // Ejemplo de uso:
// let message = "Hola, mundo!"
// let encryptedMessage = caesarCipher(message, shift: 3)
// print("Mensaje cifrado: \(encryptedMessage)") // Imprime "Krohd, pxqgr!"
