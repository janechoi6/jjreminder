//
//  DBManager.swift
//  JJReminder
//
//  Created by Naver on 2018. 3. 2..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import UIKit

class DBManager: NSObject {
    static let shared: DBManager = DBManager()
    let databaseFileName = "database.sqlite"
    var pathToDatabase: String!
    var database: FMDatabase!
    
    let field_TaskID = "taskID"
    let field_TaskTitle = "title"
    let field_TaskStatus = "status"
    let field_TaskShouldAlarm = "alarmOnDate"
    let field_TaskAlarmAt = "alarmAt"
    let field_TaskCreatedAt = "createdAt"
    let field_ShouldRepeat = "repeat"
    let field_TaskPriority = "priority"
    let field_TaskListID = "listID"
    let field_TaskMemo = "memo"
    
    override init() {
        super.init()
        
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        pathToDatabase = documentsDirectory.appending("/\(databaseFileName)")
        print("pathToDatabase: \(pathToDatabase)")
    }
    
    func createDatabase() -> Bool {
        var created = false
        
        if !FileManager.default.fileExists(atPath: pathToDatabase) {
            database = FMDatabase(path: pathToDatabase!)
            
            if database != nil {
                if database.open() {
                    let createTaskTableQuery = """
                                            create table task (taskID integer primary key autoincrement not null,
                                            title text not null,
                                            status bool not null default 0,
                                            alarmOnDate bool not null default 0,
                                            alarmAt date,
                                            createdAt date not null,
                                            repeat bool not null default 0,
                                            priority integer,
                                            listID integer,
                                            memo text)
                                            """
                    do {
                        try database.executeUpdate(createTaskTableQuery, values: nil)
                        created = true
                    } catch {
                        print("Could not create table.")
                        print(error.localizedDescription)
                    }
                    
                    database.close()
                } else {
                    print("Could not open the database.")
                }
            }
        }
        
        return created
    }
    
    func openDatabase() -> Bool {
        if database == nil {
            if FileManager.default.fileExists(atPath: pathToDatabase) {
                database = FMDatabase(path: pathToDatabase)
            }
        }
        
        if database != nil {
            if database.open() {
                return true
            }
        }
        
        return false
    }
    
    func insertTaskData() {
        if openDatabase() {
            if let pathToTasksFile = Bundle.main.path(forResource: "tasks", ofType: "tsv") {
                do {
                    let tasksFileContents = try String(contentsOfFile: pathToTasksFile)
                    
                    let tasksData = tasksFileContents.components(separatedBy: "\n")
                    
                    var query = ""
                    for task in tasksData {
                        let taskParts = task.components(separatedBy: ",")
                        
                        if taskParts.count == 9 {
                            let taskTitle = taskParts[0]
                            let taskStatus = taskParts[1]
                            let taskAlarmOnDate = taskParts[2]
                            let taskAlarmAt = taskParts[3]
                            let taskCreatedAt = taskParts[4]
                            let taskRepeat = taskParts[5]
                            let taskPriority = taskParts[6]
                            let taskListID = taskParts[7]
                            let taskMemo = taskParts[8]
                            
                            query += "insert into task (\(field_TaskID), \(field_TaskTitle), \(field_TaskStatus), \(field_TaskShouldAlarm), \(field_TaskAlarmAt), \(field_TaskCreatedAt), \(field_ShouldRepeat), \(field_TaskPriority), \(field_TaskListID), \(field_TaskMemo)) values (null, '\(taskTitle)', \(taskStatus), \(taskAlarmOnDate), \(taskAlarmAt), \(taskCreatedAt), \(taskRepeat), \(taskPriority), \(taskListID), '\(taskMemo)');"
                            print("query: \(query)")
                        }
                    }
                    
                    if !database.executeStatements(query) {
                        print("Failed to insert initial data into the database.")
                        print(database.lastError(), database.lastErrorMessage())
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            
            database.close()
        }
    }
    
    func loadTasks() -> [Task]! {
        var tasks: [Task]!
        
        if openDatabase() {
            let query = "select * from task order by \(field_TaskID) asc"
            
            do {
                print(database)
                let results = try database.executeQuery(query, values: nil)
                
                
                while results.next() {
                    
                    let task = Task.init(taskID: Int(results.int(forColumn: field_TaskID)),
                                         title: results.string(forColumn: field_TaskTitle)!,
                                         status: results.bool(forColumn: field_TaskStatus),
                                         shouldAlarm: results.bool(forColumn: field_TaskShouldAlarm),
                                         alarmAt: results.date(forColumn: field_TaskAlarmAt)!,
                                         createdAt: results.date(forColumn: field_TaskShouldAlarm)!,
                                         shouldRepeat: results.bool(forColumn: field_ShouldRepeat),
                                         priority: Int(results.int(forColumn: field_TaskPriority)),
                                         listId: Int(results.int(forColumn: field_TaskListID)),
                                         memo: results.string(forColumn: field_TaskMemo)!)

                    if tasks == nil {
                        tasks = [Task]()
                    }

                    tasks.append(task)
                }
            }
            catch {
                print(error.localizedDescription)
            }
            
            database.close()
        }
        
        return tasks
    }
}
