import Foundation

typealias EventHandler<Event> = (Event) -> ()
typealias Handler<Event, Type> = (Event, Type) -> ()
typealias EmptyHandler = () -> Void
