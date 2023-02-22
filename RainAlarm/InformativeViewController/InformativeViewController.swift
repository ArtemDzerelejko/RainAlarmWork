//
//  ViewController.swift
//  RainAlarm
//
//  Created by artem on 17.02.2023.
//

import UIKit
import CoreLocation

class InformativeViewController: IndicatorViewController {
    
    private lazy var weatherInformationView = UIView()
    private lazy var labelForWeatherInformatio = UILabel()
    private lazy var labelForCoordinates = UILabel()
    private lazy var imageViewForWeatherInformation = UIImageView()
    private lazy var temperatureLabelForWeatherInformation = UILabel()
    
    private lazy var viewForAlarmClockAtSeven = UIView()
    private lazy var labelForAlermClockAtSeven = UILabel()
    
    private lazy var viewForAlarmClockAtNine = UIView()
    private lazy var labelForAlarmClockAtNine = UILabel()
    
    private lazy var viewForСancelAlarm = UIView()
    private lazy var labelForCancelAlarm = UILabel()
    private lazy var buttonForCancelAlarm = UIButton()
    
    private let userNotifications = UserNotifications()
    
    private var weatherResult: ModelForJson?
    
    private var menager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
        self.activityIndicatorStart()
    }
}

extension InformativeViewController {
    private func configurationUI() {
        settingsMeneger()
        settingsBackgroundColor()
        
        settingsWeatherInformationView()
        settingLabelForWeatherInformatio()
        settingsLabelForCoordinates()
        settingsImageViewForWeatherInformation()
        
        settingsViewForAlarmClockAtSeven()
        settingsLabelForAlermClockAtSeven()
        
        settingsViewForAlarmClockAtNine()
        settingsLabelForAlarmClockAtNine()
        
        settingViewForСancelAlarm()
        settingLabelForCancelAlarm()
        settingButtonForCancelAlarm()
        
    }
    
    private func settingsMeneger() {
        menager = CLLocationManager()
        menager?.delegate = self
        menager?.desiredAccuracy = kCLLocationAccuracyBest
        menager?.requestWhenInUseAuthorization()
        menager?.startUpdatingLocation()
        menager?.requestAlwaysAuthorization()
    }
    
    
    private func settingsBackgroundColor() {
        view.backgroundColor = .white
    }
    
    
    private func settingsWeatherInformationView() {
        
        view.addSubview(weatherInformationView)
        weatherInformationView.backgroundColor = .grayForView
        weatherInformationView.layer.borderWidth = 1.5
        weatherInformationView.layer.cornerRadius = 15
        weatherInformationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherInformationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            weatherInformationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            weatherInformationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            weatherInformationView.heightAnchor.constraint(equalToConstant: 300),
            
        ])
    }
    
    private func settingLabelForWeatherInformatio() {
        weatherInformationView.addSubview(labelForWeatherInformatio)
        labelForWeatherInformatio.text = "Погода"
        labelForWeatherInformatio.numberOfLines = 0
        labelForWeatherInformatio.textAlignment = .center
        labelForWeatherInformatio.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelForWeatherInformatio.topAnchor.constraint(equalTo: weatherInformationView.topAnchor, constant: 30),
            labelForWeatherInformatio.centerXAnchor.constraint(equalTo: weatherInformationView.centerXAnchor)
        ])
    }
    
    private func settingsLabelForCoordinates() {
        weatherInformationView.addSubview(labelForCoordinates)
        labelForCoordinates.numberOfLines = 0
        labelForCoordinates.textAlignment = .center
        labelForCoordinates.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelForCoordinates.topAnchor.constraint(equalTo: labelForWeatherInformatio.bottomAnchor, constant: 16),
            labelForCoordinates.centerXAnchor.constraint(equalTo: weatherInformationView.centerXAnchor)
        ])
    }
    
    private func settingsImageViewForWeatherInformation() {
        weatherInformationView.addSubview(imageViewForWeatherInformation)
        imageViewForWeatherInformation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewForWeatherInformation.topAnchor.constraint(equalTo: labelForCoordinates.bottomAnchor, constant: 20),
            imageViewForWeatherInformation.centerXAnchor.constraint(equalTo: weatherInformationView.centerXAnchor),
            imageViewForWeatherInformation.heightAnchor.constraint(equalToConstant: 150),
            imageViewForWeatherInformation.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func settingsViewForAlarmClockAtSeven() {
        view.addSubview(viewForAlarmClockAtSeven)
        viewForAlarmClockAtSeven.layer.borderWidth = weatherInformationView.layer.borderWidth
        viewForAlarmClockAtSeven.layer.cornerRadius = weatherInformationView.layer.cornerRadius
        viewForAlarmClockAtSeven.backgroundColor = weatherInformationView.backgroundColor
        viewForAlarmClockAtSeven.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewForAlarmClockAtSeven.topAnchor.constraint(equalTo: weatherInformationView.bottomAnchor, constant: 10),
            viewForAlarmClockAtSeven.leadingAnchor.constraint(equalTo: weatherInformationView.leadingAnchor),
            viewForAlarmClockAtSeven.heightAnchor.constraint(equalToConstant: 300),
            viewForAlarmClockAtSeven.widthAnchor.constraint(equalToConstant: 300),
            viewForAlarmClockAtSeven.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
    
    private func settingsLabelForAlermClockAtSeven() {
        viewForAlarmClockAtSeven.addSubview(labelForAlermClockAtSeven)
        labelForAlermClockAtSeven.text = "Будильник на\n 7:00"
        labelForAlermClockAtSeven.textColor = .lightGray
        labelForAlermClockAtSeven.textAlignment = .center
        labelForAlermClockAtSeven.numberOfLines = 0
        labelForAlermClockAtSeven.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelForAlermClockAtSeven.centerYAnchor.constraint(equalTo: viewForAlarmClockAtSeven.centerYAnchor),
            labelForAlermClockAtSeven.centerXAnchor.constraint(equalTo: viewForAlarmClockAtSeven.centerXAnchor)
        ])
        
    }
    
    private func settingsViewForAlarmClockAtNine() {
        view.addSubview(viewForAlarmClockAtNine)
        viewForAlarmClockAtNine.backgroundColor = weatherInformationView.backgroundColor
        viewForAlarmClockAtNine.layer.borderWidth = weatherInformationView.layer.borderWidth
        viewForAlarmClockAtNine.layer.cornerRadius = weatherInformationView.layer.cornerRadius
        viewForAlarmClockAtNine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewForAlarmClockAtNine.topAnchor.constraint(equalTo: viewForAlarmClockAtSeven.topAnchor),
            viewForAlarmClockAtNine.leadingAnchor.constraint(equalTo: viewForAlarmClockAtSeven.trailingAnchor, constant: 10),
            viewForAlarmClockAtNine.trailingAnchor.constraint(equalTo: weatherInformationView.trailingAnchor),
            viewForAlarmClockAtNine.heightAnchor.constraint(equalTo: viewForAlarmClockAtSeven.heightAnchor),
            viewForAlarmClockAtNine.widthAnchor.constraint(equalTo: viewForAlarmClockAtSeven.widthAnchor),
            viewForAlarmClockAtNine.bottomAnchor.constraint(equalTo: viewForAlarmClockAtSeven.bottomAnchor)
        ])
    }
    
    private func settingsLabelForAlarmClockAtNine() {
        viewForAlarmClockAtNine.addSubview(labelForAlarmClockAtNine)
        labelForAlarmClockAtNine.text = "Будильник на\n 9:00"
        labelForAlarmClockAtNine.textColor = labelForAlermClockAtSeven.textColor
        labelForAlarmClockAtNine.numberOfLines = 0
        labelForAlarmClockAtNine.textAlignment = .center
        labelForAlarmClockAtNine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelForAlarmClockAtNine.centerXAnchor.constraint(equalTo: viewForAlarmClockAtNine.centerXAnchor),
            labelForAlarmClockAtNine.centerYAnchor.constraint(equalTo: viewForAlarmClockAtNine.centerYAnchor)
        ])
    }
    
    private func settingViewForСancelAlarm() {
        view.addSubview(viewForСancelAlarm)
        viewForСancelAlarm.layer.borderWidth = weatherInformationView.layer.borderWidth
        viewForСancelAlarm.layer.borderColor = UIColor.black.cgColor
        viewForСancelAlarm.layer.cornerRadius = weatherInformationView.layer.cornerRadius
        viewForСancelAlarm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewForСancelAlarm.topAnchor.constraint(equalTo: labelForAlermClockAtSeven.bottomAnchor, constant: 10),
            viewForСancelAlarm.heightAnchor.constraint(equalToConstant: 50),
            viewForСancelAlarm.leadingAnchor.constraint(equalTo: weatherInformationView.leadingAnchor),
            viewForСancelAlarm.trailingAnchor.constraint(equalTo: weatherInformationView.trailingAnchor),
            viewForСancelAlarm.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func settingLabelForCancelAlarm() {
        viewForСancelAlarm.addSubview(labelForCancelAlarm)
        labelForCancelAlarm.text = "Натисни щоб відмінити будильник"
        labelForCancelAlarm.textColor = .black
        labelForCancelAlarm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelForCancelAlarm.topAnchor.constraint(equalTo: viewForСancelAlarm.topAnchor),
            labelForCancelAlarm.leadingAnchor.constraint(equalTo: viewForСancelAlarm.leadingAnchor, constant: 10),
            labelForCancelAlarm.bottomAnchor.constraint(equalTo: viewForСancelAlarm.bottomAnchor)
        ])
    }
    
    private func settingButtonForCancelAlarm() {
        viewForСancelAlarm.addSubview(buttonForCancelAlarm)
        buttonForCancelAlarm.translatesAutoresizingMaskIntoConstraints = false
        buttonForCancelAlarm.backgroundColor = .red
        NSLayoutConstraint.activate([
            buttonForCancelAlarm.topAnchor.constraint(equalTo: viewForСancelAlarm.topAnchor, constant: 10),
            buttonForCancelAlarm.trailingAnchor.constraint(equalTo: viewForСancelAlarm.trailingAnchor, constant: -10),
            buttonForCancelAlarm.bottomAnchor.constraint(equalTo: labelForCancelAlarm.bottomAnchor, constant: -10),
            buttonForCancelAlarm.widthAnchor.constraint(equalToConstant: 30)
        ])
        buttonForCancelAlarm.addTarget(self, action: #selector(delateNot), for: .touchUpInside)
    }
    
    @objc func delateNot() {
        userNotifications.delateNotification()
    }
    
    private func updateViewIfRain() {
        let imageRain = UIImage(systemName: "cloud.rain")
        view.backgroundColor = .systemBlue
        imageViewForWeatherInformation.image = imageRain
        labelForAlarmClockAtNine.textColor = .white
        imageViewForWeatherInformation.tintColor = .blue
        viewForAlarmClockAtNine.backgroundColor = .blue
        viewForAlarmClockAtNine.layer.borderColor = UIColor.blue.cgColor
        weatherInformationView.layer.borderColor = viewForAlarmClockAtNine.layer.borderColor
    }
    
    private func updateViewIfSun() {
        let imageSun = UIImage(systemName: "sun.max")
        view.backgroundColor = .systemYellow
        imageViewForWeatherInformation.image = imageSun
        labelForAlermClockAtSeven.textColor = .black
        imageViewForWeatherInformation.tintColor = .yellow
        viewForAlarmClockAtSeven.backgroundColor = .yellow
        viewForAlarmClockAtSeven.layer.borderColor = UIColor.yellow.cgColor
        weatherInformationView.layer.borderColor = viewForAlarmClockAtSeven.layer.borderColor
    }
    
}

extension InformativeViewController {
    private func getWeather(latitude: String, longitude: String) {
        NetworkService.shared.url_latitude = latitude
        NetworkService.shared.url_longitude = longitude
        NetworkService.shared.getWeather(onSuccess: { [weak self] result in
            guard let strongSelf = self else {return}
            guard let result = result else {return}
            strongSelf.menager?.stopUpdatingLocation()
            strongSelf.weatherResult = result
            strongSelf.updateUI()
        }) { (errorMessage) in
            debugPrint(errorMessage)
        }
    }
    
    private func updateUI() {
        self.activityIndicatorStop()
        guard let weatherResult = weatherResult else {return}
        guard let weatherResultLat = weatherResult.lat else {return}
        guard let weatherResultLon = weatherResult.lon else {return}
        labelForCoordinates.text = "Координати\nширота: \(weatherResultLat) довгота: \(weatherResultLon)"
        getDataFromArrayHourly()
    }
    
    private func getDataFromArrayHourly() {
        guard let diferenceSeconds = getDiferenceSeconds(timeWhatWeWhant: 7) else {return}// різниця між теперішнім і тим коли встановлюємо будильник
        let diferenceHours = Int(diferenceSeconds / 3600)
        guard let weatherResult = weatherResult else {return}
        guard let hourlyWeather = weatherResult.hourly else {return}
        let hourly = hourlyWeather[diferenceHours + 1]
        checkRein(hourly: hourly)
    }
    
    private func checkRein(hourly: Hourly) {
        guard let weatherHourly = hourly.weather else {return}
        guard let weather = weatherHourly.first else {return}
        guard let main = weather.main else {return}
        if main == "Rain" {
            guard let secondNine = getDiferenceSeconds(timeWhatWeWhant: 9) else {return}
            updateViewIfRain()
            userNotifications.createNotification(timeInterval: secondNine, title: "Добрий ранок", subtitle: "Час прокидатися 9 година", body: "Гарного дня", sound: UNNotificationSound(named: UNNotificationSoundName("first.caf")))
        } else {
            guard let secondSeven = getDiferenceSeconds(timeWhatWeWhant: 7) else {return}
            updateViewIfSun()
            userNotifications.createNotification(timeInterval: secondSeven, title: "Доброго ранку", subtitle: "Час прокидатися 7 година", body: "Продуктивного дня", sound: UNNotificationSound(named: UNNotificationSoundName("second.caf")))
        }
    }
    
    private func getDiferenceSeconds(timeWhatWeWhant: Int) -> Double? {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date) // витягуємо з дати часи
        if hour < timeWhatWeWhant {
            guard let todayDate = getTodayDate(hour: timeWhatWeWhant) else {return nil}
            let diferendSecond = todayDate.timeIntervalSinceReferenceDate - date.timeIntervalSinceReferenceDate
            return diferendSecond
        } else {
            guard let tomorrowDate = getTomorroDate(hour: timeWhatWeWhant) else {return nil}
            let diferendSecond = tomorrowDate.timeIntervalSinceReferenceDate - date.timeIntervalSinceReferenceDate//різниця в сек
            return diferendSecond
        }
    }
    
    private func getTodayDate(hour: Int) -> Date? {
        guard let todayDate =  Calendar.current.date(bySettingHour: hour, minute: 0, second: 0, of: Date()) else {return nil} // створюємо дату з указаним часом
        return todayDate
    }
    
    private func getTomorroDate(hour: Int) -> Date? {
        guard let todayDate = getTodayDate(hour: hour) else {return nil}//сьогоднішній день з указаним часом
        guard let tomarrowDay = Calendar.current.date(byAdding: .day, value: 1, to: todayDate) else {return nil}// + день
        return tomarrowDay
    }
}

extension InformativeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let first = locations.first else {
            return
        }
        getWeather(latitude: String(first.coordinate.latitude), longitude: String(first.coordinate.longitude))
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            print("manager work")
        case .notDetermined, .denied, .restricted:
            print("manager notDeterminate")
        default: break
        }
    }
}

