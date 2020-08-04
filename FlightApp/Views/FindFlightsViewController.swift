//
//  FindFlightsViewController.swift
//  FlightApp
//
//  Created by João Palma on 31/07/2020.
//  Copyright © 2020 João Palma. All rights reserved.
//

import UIKit

class FindFlightsViewController : FormBaseViewController<FindFlightsViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.findFlightsTitleLabel
       _setupView()
    }

    private func _setupView() {
        _clearButton()
        
        formViewAlignment = .top
        formContainerStackView.spacing = 12
        formContainerStackView.layoutMargins = .init(top: 12, left: 12, bottom: 100, right: 12)
        
        let flightPlacesView = backgroundRoundBorderView()
        flightPlacesView.constrainHeight(150)
        
        _addSwapCountriesStack(flightPlacesView)
        _addCountriesStackAndSeparator(flightPlacesView)

        formContainerStackView.addArrangedSubview(flightPlacesView)
        formContainerStackView.addArrangedSubview(_formCard(descriptionLabel: viewModel.departureLabel, valueLabel: "24 Feb, Wed"))
        formContainerStackView.addArrangedSubview(_formCard(descriptionLabel: viewModel.passengersLabel, valueLabel: "1 Adult"))
        
        _submitButton()
    }
    
    private func _clearButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: viewModel.clearLabel, style: .plain, target: self, action: #selector(_clearButtonAction))
    }
    
    private func _addSwapCountriesStack(_ flightPlacesView : UIView) {
        let label1 = UILabel(text: "LTN", font: .boldSystemFont(ofSize: 16), textColor: UIColor.Theme.darkGrey, textAlignment: .center, numberOfLines: 1)
        let label2 = UILabel(text: "PAR", font: .boldSystemFont(ofSize: 16), textColor: UIColor.Theme.darkGrey, textAlignment: .center, numberOfLines: 1)
        
        let swapImageView = getImageInBlue("Swap")
        
        let swapStack = UIView().stack(
            label1,
            swapImageView,
            label2,
            spacing: 10
        )
        
        flightPlacesView.addSubview(swapStack)
        swapStack.anchor(top: nil, leading: nil, bottom: nil, trailing: flightPlacesView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 22))
        swapStack.centerYAnchor.constraint(equalTo: flightPlacesView.centerYAnchor).isActive = true
    }
    
    private func _addCountriesStackAndSeparator(_ flightPlacesView : UIView) {
        let topCountryStack = _countriesFormView(imageName: "Airplane1", subtitleLabel: viewModel.originLabel, countryLabel: "London")
        let bottomCountryStack = _countriesFormView(imageName: "Airplane2", subtitleLabel: viewModel.destinationLabel, countryLabel: "Spain")
        
        let countriesStack = UIView().stack(
            topCountryStack,
            bottomCountryStack,
            spacing: 28
        )
        
        flightPlacesView.addSubview(countriesStack)
        countriesStack.anchor(top: nil, leading: flightPlacesView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 22, bottom: 0, right: 0))
        countriesStack.centerYAnchor.constraint(equalTo: flightPlacesView.centerYAnchor).isActive = true
        
        let separatorLine = UIView()
        separatorLine.constrainHeight(1.5)
        separatorLine.backgroundColor = UIColor.Theme.grey
        
        flightPlacesView.addSubview(separatorLine)
        separatorLine.anchor(top: nil, leading: countriesStack.leadingAnchor, bottom: nil,
                             trailing: flightPlacesView.subviews.first!.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 18))
        separatorLine.centerYAnchor.constraint(equalTo: flightPlacesView.centerYAnchor).isActive = true
        
        let button = UIButton(title: "", titleColor: .clear, font: .systemFont(ofSize: 0), backgroundColor: .clear, target: self, action: #selector(_originCountryButtonAction))
        flightPlacesView.addSubview(button)
        button.anchor(top: countriesStack.topAnchor, leading: countriesStack.leadingAnchor, bottom: separatorLine.topAnchor, trailing: separatorLine.trailingAnchor,
                      padding: .init(top: 0, left: 0, bottom: 3, right: 5))
        
        let button2 = UIButton(title: "", titleColor: .clear, font: .systemFont(ofSize: 0), backgroundColor: .clear, target: self, action: #selector(_destinationCountryButtonAction))
        flightPlacesView.addSubview(button2)
        button2.anchor(top: separatorLine.bottomAnchor, leading: countriesStack.leadingAnchor, bottom: countriesStack.bottomAnchor, trailing: separatorLine.trailingAnchor,
                       padding: .init(top: 3, left: 0, bottom: 0, right: 5))
        
    }
    
    private func _countriesFormView(imageName : String, subtitleLabel : String, countryLabel : String) -> UIView {
        let imageView = getImageInBlue(imageName)
        let countriesDetails = _cardDetails(descriptionLabel: subtitleLabel, valueLabel: countryLabel)
        
        let countriesStack = UIView().hstack(
            imageView,
            countriesDetails,
            UIView(),
            spacing: 16
        )
        
        return countriesStack
    }
    
    private func _cardDetails(descriptionLabel : String, valueLabel : String) -> UIView {
        let cardDescription = UIView().stack(
            UILabel(text: descriptionLabel, font: .systemFont(ofSize: 12, weight: .medium), textColor: UIColor.Theme.darkGrey, textAlignment: .left, numberOfLines: 1),
            UILabel(text: valueLabel, font: .boldSystemFont(ofSize: 16), textColor: UIColor.Theme.black, textAlignment: .left, numberOfLines: 1),
            spacing: 4
        )
        
        return cardDescription
    }
    
    
    private func _formCard(descriptionLabel : String, valueLabel : String) -> UIView {
        let cardView = backgroundRoundBorderView()
        cardView.constrainHeight(90)
        
        let details = _cardDetails(descriptionLabel: descriptionLabel, valueLabel: valueLabel)
        let imageView = getImageInBlue("DownArrow")
        
        cardView.hstack(
            details,
            UIView(),
            imageView,
            spacing: 0,
            alignment: .center
        ).padLeft(22).padRight(22)
        
        let button = UIButton(title: "", titleColor: .clear, font: .systemFont(ofSize: 0), backgroundColor: .clear, target: self, action: #selector(_originCountryButtonAction))
        cardView.addSubview(button)
        button.anchor(top: cardView.topAnchor, leading: cardView.leadingAnchor, bottom: cardView.bottomAnchor, trailing: cardView.trailingAnchor, padding: .allSides(5))
        
        return cardView
    }
    
    
    private func _submitButton() {
        let button = createMainBlueButton(name: viewModel.letsGoLabel, target: self, action: #selector(_submitButtonAction))
        
        self.view.addSubview(button)
        button.anchor(top: nil, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                      trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 12, bottom: 15, right: 12))
    }
    
    @objc fileprivate func _clearButtonAction() {
        print("clicked")
    }
    
    @objc fileprivate func _submitButtonAction() {
        print("clicked")
    }
    
    @objc fileprivate func _originCountryButtonAction() {
        print("clicked")
    }
    
    @objc fileprivate func _destinationCountryButtonAction() {
        print("clicked")
    }
}
