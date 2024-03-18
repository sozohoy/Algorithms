func solution(_ s:String) -> String {
    let result = s.split(separator: " ").map { Int($0)! }
    return "\(result.min()!) \(result.max()!)"
}