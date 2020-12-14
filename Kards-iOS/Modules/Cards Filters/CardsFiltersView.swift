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

struct CardsFiltersView: View {
    @ObservedObject var viewModel: CardsFiltersViewModel
    
    init(viewModel: CardsFiltersViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        contentView
    }
    
    private var contentView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                nationView
                kreditsView
                typesView
                rarityView
                setView
                searchView
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
    
    private var nationView: some View {
        nationSectionView(
            String.cardFiltersNations,
            data: viewModel.nations,
            selection: viewModel.cardFilters.nations,
            action: viewModel.pressNation
        )
    }
    
    private var kreditsView: some View {
        sectionView(String.cardFiltersKredits) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: .kreditsBtnWidth))], spacing: 5) {
                ForEach(0..<8) { kredits in
                    KreditButtonView(kredits, callback: { [unowned viewModel] in
                        viewModel.pressKredits(kredits)
                    })
                    .opacity(viewModel.cardFilters.kredits.isEmpty
                                || viewModel.cardFilters.kredits.contains(kredits) ?
                                .activeOpacity : .inactiveOpacity)
                }
            }
        }
    }
    
    private var typesView: some View {
        sectionView(String.cardFiltersTypes) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: .cardTypeBtnWidth))], spacing: 5) {
                ForEach(viewModel.types, id: \.rawValue) { [unowned viewModel] type in
                    CardTypeView(type) {
                        viewModel.pressCardType(type)
                    }
                    .opacity(viewModel.cardFilters.types.isEmpty
                                || viewModel.cardFilters.types.contains(type) ?
                                .activeOpacity : .inactiveOpacity)
                }
            }
        }
    }
    
    private var rarityView: some View {
        sectionView(String.cardRarity) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: .cardTypeBtnWidth))], spacing: 5) {
                ForEach(viewModel.rarityArray, id: \.rawValue) { rarity in
                    CardRarityView(rarity) { [unowned viewModel] in
                        viewModel.pressCardRarity(rarity)
                    }
                    .opacity(viewModel.cardFilters.rarity.isEmpty
                                || viewModel.cardFilters.rarity.contains(rarity) ?
                                .activeOpacity : .inactiveOpacity)
                }
            }
        }
    }
    
    private var setView: some View {
        sectionView(String.cardSet) {
            HStack {
                Spacer()
                Picker(String.cardFiltersSet, selection: $viewModel.cardFilters.set) {
                    ForEach(CardSet.allCases, id: \.rawValue) { set in
                        Text(set.localizedName)
                            .font(.uiButtonLabel)
                            .foregroundColor(.bodyText)
                            .tag(set)
                    }
                }
                .frame(width: .filtersPickerWidth, height: .filtersPickerHeight)
                Spacer()
            }
        }
    }
    
    private var searchView: some View {
        sectionView(String.cardFiltersSearch) {
            MainTextField(
                String.deckFiltersName,
                text: $viewModel.cardFilters.query
            )
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

struct CardsFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        CardsFiltersView(viewModel: CardsFiltersViewModel(filters: DataManager.current.filtersManager.cardFilters))
    }
}
