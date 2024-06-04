import Swift

class PoliAlfabeticoVigenere {
    // Atributo
    private let ALFABETO: [String]
    private let clave: String

    init(clave: String) {
        self.ALFABETO = ["A", "B", "C", "D", "E", "F", "G", "H",
                         "I", "J", "K", "L", "M", "N", "Ñ", "O", 
                         "P", "Q", "R", "S", "T", "U", "V", "W",
                          "X", "Y", "Z"]
        
        if clave.isEmpty {
            fatalError("La clave no puede estar vacía.")
        }
        
        self.clave = clave.uppercased()
    }

    private func findIndex(of element: String) -> Int? {
        for (index, value) in ALFABETO.enumerated() {
            if value == element {
                return index
            }
        }
        return nil
    }

    func cifrar(_ mensaje: String) -> String {
        var resultado = ""
        var claveIndex = 0

        for carMsj in mensaje.uppercased() {
            let carMsjStr = String(carMsj)
            if let posMsj = findIndex(of: carMsjStr) {
                let carClave = clave[clave.index(clave.startIndex, offsetBy: claveIndex % clave.count)]
                let carClaveStr = String(carClave)
                if let posClave = findIndex(of: carClaveStr) {
                    let nuevaPos = (posMsj + posClave) % ALFABETO.count
                    let nuevoCaracter = ALFABETO[nuevaPos]
                    resultado.append(nuevoCaracter)
                    claveIndex += 1
                }
            } else {
                resultado.append(carMsj) // Agregar caracteres no en el alfabeto sin cifrar
            }
        }

        return resultado
    }


    func descifrar(_ mensajeCifrado: String) -> String {
        var resultado = ""
        var claveIndex = 0

        for carMsj in mensajeCifrado.uppercased() {
            let carMsjStr = String(carMsj)
            if let posMsj = findIndex(of: carMsjStr) {
                let carClave = clave[clave.index(clave.startIndex, offsetBy: claveIndex % clave.count)]
                let carClaveStr = String(carClave)
                if let posClave = findIndex(of: carClaveStr) {
                    let nuevaPos = (posMsj - posClave + ALFABETO.count) % ALFABETO.count
                    let nuevoCaracter = ALFABETO[nuevaPos]
                    resultado.append(nuevoCaracter)
                    claveIndex += 1
                }
            } else {
                resultado.append(carMsj) // Agregar caracteres no en el alfabeto sin descifrar
            }
        }

        return resultado
    }


}

// Ejemplo de uso
let poly = PoliAlfabeticoVigenere(clave: "clave")
let mensaje = "Hola Mundo"
let mensajeCifrado = poly.cifrar(mensaje)
print("Mensaje original: \(mensaje)")
print("Mensaje cifrado: \(mensajeCifrado)")

let mensajeDescifrado = poly.descifrar(mensajeCifrado)
print("Mensaje cifrado: \(mensajeCifrado)")
print("Mensaje descifrado: \(mensajeDescifrado)")
