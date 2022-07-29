//
//  GoalEntity+CoreDataProperties.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 29/07/22.
//
//

import Foundation
import CoreData


extension GoalEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GoalEntity> {
        return NSFetchRequest<GoalEntity>(entityName: "GoalEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var duration: Int32
    @NSManaged public var reminder: Date?
    @NSManaged public var desc: String?
    @NSManaged public var goalToSessions: Set<SessionEntity>?
    public var sessionEntity: [SessionEntity]{
        let setSession = goalToSessions
        return setSession!.sorted{
            $0.endTime! > $1.endTime!
        }
    }
    
    

}

// MARK: Generated accessors for goalToSessions
extension GoalEntity {

    @objc(addGoalToSessionsObject:)
    @NSManaged public func addToGoalToSessions(_ value: SessionEntity)

    @objc(removeGoalToSessionsObject:)
    @NSManaged public func removeFromGoalToSessions(_ value: SessionEntity)

    @objc(addGoalToSessions:)
    @NSManaged public func addToGoalToSessions(_ values: NSSet)

    @objc(removeGoalToSessions:)
    @NSManaged public func removeFromGoalToSessions(_ values: NSSet)

}

extension GoalEntity : Identifiable {

}
