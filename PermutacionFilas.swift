import Swift

class PermutacionPorFilas {
    private let numFilas: Int
    private let numColumnas: Int

    init(numFilas: Int, numColumnas: Int) {
        self.numFilas = numFilas
        self.numColumnas = numColumnas
    }

    func cifrar(_ mensaje: String) -> String {
        var matriz = Array(repeating: Array(repeating: "X", count: numColumnas), count: numFilas)
        let mensajeChars = Array(mensaje)
        let mensajeLength = mensajeChars.count

        // Llenar la matriz con el mensaje
        var index = 0
        for j in 0..<numColumnas {
            for i in 0..<numFilas {
                if index < mensajeLength {
                    matriz[i][j] = String(mensajeChars[index])
                    index += 1
                }
            }
        }

        // Leer la matriz por filas
        var resultado = ""
        for i in 0..<numFilas {
            for j in 0..<numColumnas {
                resultado += matriz[i][j]
            }
        }

        return resultado
    }

    func descifrar(_ mensajeCifrado: String) -> String {
        var matriz = Array(repeating: Array(repeating: "X", count: numColumnas), count: numFilas)
        let mensajeChars = Array(mensajeCifrado)
        let mensajeLength = mensajeChars.count

        // Llenar la matriz con el mensaje cifrado por filas
        var index = 0
        for i in 0..<numFilas {
            for j in 0..<numColumnas {
                if index < mensajeLength {
                    matriz[i][j] = String(mensajeChars[index])
                    index += 1
                }
            }
        }
        // Leer la matriz por columnas
        var resultado = ""
        for j in 0..<numColumnas {
            for i in 0..<numFilas {
                resultado += matriz[i][j]
            }
        }

        // Eliminar caracteres 'X' adicionales al final
        var lastIndex = resultado.count - 1
        while lastIndex >= 0 && matriz[numFilas - 1][lastIndex % numColumnas] == "X" {
            resultado.removeLast()
            lastIndex -= 1
        }
        return resultado
    }


}

// Ejemplo de uso
let permutacion = PermutacionPorFilas(numFilas: 3, numColumnas: 5)
let mensaje = "Hola Mundo"
let mensajeCifrado = permutacion.cifrar(mensaje)
print("Mensaje original: \(mensaje)")
print("Mensaje cifrado: \(mensajeCifrado)")

let mensajeDescifrado = permutacion.descifrar(mensajeCifrado)
print("Mensaje cifrado: \(mensajeCifrado)")
print("Mensaje descifrado: \(mensajeDescifrado)")
