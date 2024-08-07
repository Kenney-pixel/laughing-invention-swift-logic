indirect enum LogicExpression: CustomStringConvertible {
    case constant(String)
    case variable(String)
    case not(LogicExpression)
    case and(LogicExpression, LogicExpression)
    case or(LogicExpression, LogicExpression)
    case implies(LogicExpression, LogicExpression)

    var description: String {
        switch self {
            case let .constant(value):
                return value
            case let .variable(value):
                return value
            case let .not(operand):
                return "~" + "\(operand)"
            case let .and(left, right):
                return "(\(left) & \(right))"
            case let .or(left, right):
                return "(\(left) | \(right))"
            case let .implies(hypothesis, conclusion):
                return "(\(hypothesis) -> \(conclusion))"
        }
    }
}

extension LogicExpression {
    init?(_ string: String, value: String?=nil, left: LogicExpression?=nil, right: LogicExpression?=nil) {
        switch(string) {
            case "constant":
                guard let value=value, (value=='T' || value=='F') else { return nil }
            case "variable":
        }
    }
}

let expr = LogicExpression.and(.variable("p123"), .or(.variable("x345"), .not(.constant("T"))))
print(expr)
