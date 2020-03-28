//
//  ZodiacTableViewDataSource.swift
//  ChineseZodiac
//
//  Created by Kevin Peng on 2020-02-20.
//  Copyright © 2020 Monorail Apps. All rights reserved.
//

import UIKit
import CoreData



final class ZodiacTableViewDataSource: NSObject, UITableViewDataSource {
  
  var dataManager: PersonDataManaging!
  
  var sort: PersonSort = .createdOn {
    didSet {
      dataManager.sort = sort
    }
  }
  
  var numberOfRows: Int {
    dataManager.numberOfObjects
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
    configureCell(cell: cell, indexPath: indexPath)
    return cell
  }
  
  func configureCell(cell: PersonCell, indexPath: IndexPath) {
    let person = dataManager.fetch(at: indexPath)
    cell.configureCell(person: person)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfRows
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func person(at item: Int) -> Person {
    dataManager.fetch(at: IndexPath(row: item, section: 0))
  }
  
  func deletePerson(at row: Int) {
    let personToDelete = person(at: row)
    dataManager.delete(personToDelete)
  }

}



