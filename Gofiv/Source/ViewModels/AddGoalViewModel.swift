//
//  AddGoal.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 29/07/22.
//

import CoreData
import UserNotifications
struct AddGoalViewModel {
  func fetchGoal(for objectId: NSManagedObjectID, context: NSManagedObjectContext) -> GoalEntity? {
    guard let goal = context.object(with: objectId) as? GoalEntity else {
      return nil
    }

    return goal
  }

  func saveGoal(
    goalId: NSManagedObjectID?,
    with goalValue: GoalValue,
    in context: NSManagedObjectContext
  ) {
    let goal: GoalEntity
    if let objectId = goalId,
      let fetchedGoal = fetchGoal(for: objectId, context: context) {
      goal = fetchedGoal
    } else {
      goal = GoalEntity(context: context)
    }

      goal.id = goalValue.id
      goal.title = goalValue.title
      goal.duration = Int32(goalValue.duration)
      goal.reminder = goalValue.reminder
      goal.desc = goalValue.description
    do {
      try context.save()
    } catch {
      print("Save error: \(error)")
    }
  }
}


