
public enum State {
    case idle
    case fetching
    case fetched
    case error(Error)
}
