//
//  ContentView.swift
//  test0807
//
//  Created by Ys on 2020/08/07.
//  Copyright © 2020 Ys. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List Up")
                    }
                }
                .tag(0)
            
            LibraryView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.stack")
                        Text("Library")
                    }
                }
                .tag(1)
            
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(2)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct ListView: View {
    var body: some View {
        NavigationView {
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Text("Hey!")
            }.navigationBarTitle("List Up ")
        }
    }
}

struct Fruit: Identifiable {
    let id: Int
    let name: String
}

struct LibraryView: View {
    let fruits: [Fruit] = [
        Fruit(id: 0, name: "Apple"),
        Fruit(id: 1, name: "Orange"),
        Fruit(id: 2, name: "Grape")
    ]
    var body: some View {
        NavigationView {
            List(fruits) { fruit in
                NavigationLink(destination: DetailView(fruit: fruit)) {
                    Text(fruit.name)
                }
            }.navigationBarTitle("Library")
        }
    }
}

struct SearchView: View {
    var body: some View {
        NavigationView {
            Text("Weee!!!")
            .font(.largeTitle)
            .navigationBarTitle("Search")
        }
    }
}

struct DetailView: View {
    let fruit: Fruit
    var body: some View {
        NavigationView {
            Text(String(fruit.id))
        }.navigationBarTitle(fruit.name)
    }
}
