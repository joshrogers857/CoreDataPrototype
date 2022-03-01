//
//  ContentView.swift
//  CoreDataPrototype
//
//  Created by Joshua Rogers on 01/03/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Product.name, ascending: true)
        ]
    ) var products: FetchedResults<Product>

    var body: some View {
        NavigationView {
            List {
                ForEach(products, id: \.self) { product in
                    Text(product.name ?? "Unknown")
                }
                .onDelete(perform: deleteProduct)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addProduct) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }
    
    private func addProduct() {
        let product = Product(context: viewContext)
        product.name = "new"
        product.ean = "12345"
        
        PersistenceController.shared.save()
    }
    
    private func deleteProduct(at offsets: IndexSet) {
        for index in offsets {
            let product = products[index]
            viewContext.delete(product)
            PersistenceController.shared.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
