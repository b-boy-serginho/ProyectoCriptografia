import Swift // Asegúrate de usar Foundation para funcionalidad básica en Swift

class Cesar {
    private var alfabeto: [String]
    
    init() {
        self.alfabeto = [
            "A", "!", "B", "@", "C", "#", "D", "$", "E", "%",
            "F", "^", "G", "&", "H", "*", "I", "(", "J", ")",                              
            "K", "0", "L", "1", "M", "2", "N", "3", "O", "4",
            "P", "5", "Q", "6", "R", "7", "S", "8", "T", "9",
            "U", "a", "V", "b", "W", "c", "X", "d", "Y",       
            "Z", "e", "f", "g", "h", "i", "j", "k", "l", "m",
            "n", "o", "p", "q", "r", "s", "t", "u", "v", "w",
              "x", "y", "z", "_", "+", " ",       
        ]
    }
    
    
    func findIndex(of element: String) -> Int? {
        for (index, value) in alfabeto.enumerated() {
            if value == element {
                return index
            }
        }
        return nil
    }
    
    func cifrar(_ mensaje: String, desplazamiento: Int) -> String {
        if desplazamiento < 0 {
            return "Desplazamiento fuera de rango"
        } else if desplazamiento == 0 {
            return "Desplazamiento debe ser mayor a Cero"
        }
        
        var resultado = ""
        for c in mensaje {
            let charAsString = String(c).uppercased()
            if let pos = findIndex(of: charAsString) {
                let nuevaPos = (pos + desplazamiento) % alfabeto.count
                let nuevoCaracter = alfabeto[nuevaPos]
                resultado.append(nuevoCaracter)
            } else {
                return "No se encuentra el caracter en este alfabeto"
            }
        }
        return resultado
    }

    func descifrar(_ mensaje: String, desplazamiento: Int) -> String {
        if desplazamiento < 0 {
            return "Desplazamiento fuera de rango"
        } else if (desplazamiento == 0) {
            return "Desplazamiento debe ser mayor a Cero"
        }
        
        var resultado = ""
        for c in mensaje {
            let charAsString = String(c).uppercased()
            if let pos = findIndex(of: charAsString) {
                var nuevaPos = (pos - desplazamiento) % alfabeto.count
                // Asegurarse de que la nueva posición no sea negativa
                if nuevaPos < 0 {
                    nuevaPos += alfabeto.count
                }
                let nuevoCaracter = alfabeto[nuevaPos]
                resultado.append(nuevoCaracter)
            } else {
                return "No se encuentra el caracter en este alfabeto"
            }
        }
        return resultado
    }
}

// Ejemplo de uso
let cesar = Cesar()
let mensaje = "lab "
let desplazamiento = 1

let mensajeCifrado = cesar.cifrar(mensaje, desplazamiento: desplazamiento)
print("Mensaje original: \(mensaje)")
print("Mensaje cifrado: \(mensajeCifrado)")

let mensajeDescifrado = cesar.descifrar(mensajeCifrado, desplazamiento: desplazamiento)
print("Mensaje original: \(mensajeCifrado)")
print("Mensaje descifrado: \(mensajeDescifrado)")

