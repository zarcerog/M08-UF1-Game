import Foundation

struct ScoreHistoryItem: Identifiable {
    let id = UUID()
    let score: Int
    let time: String
}

struct Game {
    private(set) var target = Int.random(in: 1...100)
    private(set) var score = 0
    private(set) var points = 0
    private(set) var round = 1
    private var scoresHistory: [ScoreHistoryItem] = []
    
    mutating func score(sliderValue: Int){
        points = 100-abs(sliderValue-target)
        score+=points
    }
    
    mutating func saveScores() {
        let currentTime = getCurrentTime()
        let newItem = ScoreHistoryItem(score: score, time: currentTime)
        scoresHistory.append(newItem)
        scoresHistory.sort { $0.score > $1.score }
        if scoresHistory.count > 5 {
            scoresHistory.removeLast()
        }
    }
    
    private func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }
    
    mutating func restartRound(){
        target = Int.random(in: 1...100)
        round+=1
    }
    
    mutating func restartGame() {
        scoresHistory = []
        score = 0
        round = 1
    }
    
    func getScoresHistory() -> [ScoreHistoryItem] {
        return scoresHistory
    }
}
