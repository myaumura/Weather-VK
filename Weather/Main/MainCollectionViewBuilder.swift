//
//  MainCollectionViewBuilder.swift
//  Weather
//
//  Created by Kirill Gusev on 24.03.2024.
//

import Foundation

final class MainCollectionViewBuilder: CollectionViewBuilder {
    
    var width: CGFloat = 0
    
    func build() -> [SectionViewModel] {
        var sections = [SectionViewModel]()
        
        let baseVM = MainCellViewModel()
        let vm = CellViewModel(viewModel: baseVM,
                        cellId: CurrentWeatherView.reuseIdentifier,
                        size: CGSize(width: width, height: 300))
        
        let sectionViewModel = SectionViewModel()
        sectionViewModel.addCell(vm)
        sections.append(sectionViewModel)
        
        let sectionViewModel1 = SectionViewModel()
        sectionViewModel1.addCell(createSection2())
        sections.append(sectionViewModel1)
        
        let sectionViewModel2 = SectionViewModel()
        sectionViewModel2.addCell(createSection3())
        sections.append(sectionViewModel2)
        

        return sections
    }
    
    func createSection2() -> CellViewModel {
        let baseVM = MainCellViewModel()
        return CellViewModel(viewModel: baseVM,
                        cellId: HourlyWeatherView.reuseIdentifier,
                        size: CGSize(width: width, height: 120))
    }
    
    func createSection3() -> CellViewModel {
        let baseVM = MainCellViewModel()
        let vm = CellViewModel(viewModel: baseVM,
                        cellId: DailyWeatherView.reuseIdentifier,
                        size: CGSize(width: width, height: 305))
        return vm
    }
}

final class MainCellViewModel: CellBaseViewModel {
    
}
