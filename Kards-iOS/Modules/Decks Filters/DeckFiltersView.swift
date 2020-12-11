// Copyright (c) 2020 Matthias Lapierre
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import SwiftUI

struct DeckFiltersView: View {
    
    @ObservedObject var viewModel: DeckFiltersViewModel
    
    init(viewModel: DeckFiltersViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        contentView
    }
    
    private var contentView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                mainNationView
                alliedNationView
                searchView
                sortBy
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
    
    private var mainNationView: some View {
        nationSectionView(
            String.deckFiltersMainNations,
            data: viewModel.mainNations,
            selection: viewModel.deckFilters.mainNation,
            action: viewModel.pressMainNation
        )
    }
    
    private var alliedNationView: some View {
        nationSectionView(
            String.deckFiltersAlliedNations,
            data: viewModel.alliedNations,
            selection: viewModel.deckFilters.alliedNation,
            action: viewModel.pressAlliedNation
        )
    }
    
    private var searchView: some View {
        sectionView(String.deckFiltersName) {
            MainTextField(
                String.deckFiltersName,
                text: $viewModel.deckFilters.query
            )
        }
    }
    
    private var sortBy: some View {
        sectionView(String.deckFiltersSortBy) {
            HStack {
                Spacer()
                Picker(String.deckFiltersSortBy, selection: $viewModel.deckFilters.sortBy) {
                    ForEach(DeckSortType.allCases, id: \.rawValue) { sortType in
                        Text(sortType.localizedName)
                            .font(.uiButtonLabel)
                            .foregroundColor(.bodyText)
                            .tag(sortType)
                    }
                }
                .frame(width: 200, height: 100)
                Spacer()
            }
        }
    }
    
    private func nationSectionView(_ title: String, data: [Nation], selection: Set<Nation>, action: @escaping (Nation) -> ()) -> some View {
        sectionView(title) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: .nationBtnWidth))]) {
                ForEach(data, id: \.rawValue) { nation in
                    NationButtonView(nation: nation) {
                        action(nation)
                    }
                    .opacity(selection.isEmpty || selection.contains(nation) ? 1.0 : 0.3)
                }
            }
        }
    }
    
    private func sectionView<Content: View>(_ title: String, @ViewBuilder content: @escaping () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.uiTitle3)
                .foregroundColor(.titleText)
            content()
        }
    }
    
}

struct DeckFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        DeckFiltersView(
            viewModel: DeckFiltersViewModel(
                filters: DataManager.current.filtersManager.deckFilters
            )
        )
    }
}
