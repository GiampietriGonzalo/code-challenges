your monthly phone bill just arrived, and it's unexpectedly large. You decide to verify the amount by recalculating the bill based on your phone call logs and the phone company's charges.
The logs are given as a string s consisting of n lines separated by newline characters. Each line describes one phone call using the following format: "hh:mm:ss,nnn-nnn-nnn", where hh:mm:ss denotes the time of the start of the call (in "hh" hours, "mm" minutes and "ss" seconds format), and nnn-nnn-nnn denotes the 9-digit phone number of the recipient (with no leading zeros).
Each call is billed separately. The billing rules are as follows:
- If the call was < 5 minutes long, then you pay 3 cents for every started second of the call (e.g. for duration "00:01:07" you pay 67 * 3 = 201 cents)
- If the call was at least 5 minutes long, then you pay 150 cents for every started minute of the call. (ex: for 00:05:01 the bill is 6 * 150 = 900) the function should return 900.
- The company plan includes a prom for the phone number with the TOTAL longest calls duration. For that phone number all the bills will be free. In case of tie, the selected phone number is the lower one.
The range of the phone number is (000-000-000, 999-999-999]
The range of the hours is [00, 99]
The range of the minutes is [00, 59]
The range of the seconds is [00, 59]


import Foundation

func phoneBill(_ s: String) -> Int {
    var callDetails = [(String, String)]() // [(start time, phone number)]
    var phoneCallDurations = [String: Int]() // [phone number: total duration in seconds]
    var phoneCallCosts = [String: Int]() // [phone number: total cost in cents]
    var longestDurationPhone = ""
    
    // Step 1: Parse the input string and store call details
    let lines = s.components(separatedBy: "\n")
    for line in lines {
        let components = line.components(separatedBy: ",")
        if components.count == 2 {
            let startTime = components[0]
            let phoneNumber = components[1]
            callDetails.append((startTime, phoneNumber))
        }
    }
    
    // Step 2: Calculate the duration and cost for each call
    for (startTime, phoneNumber) in callDetails {
        let durationInSeconds = calculateDurationInSeconds(startTime)
        let cost = calculateCost(durationInSeconds)
        
        // Step 3: Update total duration and cost for each phone number
        if let totalDuration = phoneCallDurations[phoneNumber] {
            phoneCallDurations[phoneNumber] = totalDuration + durationInSeconds
            phoneCallCosts[phoneNumber] = phoneCallCosts[phoneNumber]! + cost
        } else {
            phoneCallDurations[phoneNumber] = durationInSeconds
            phoneCallCosts[phoneNumber] = cost
        }
        
        // Step 4: Identify the phone number with the longest total call duration
        if longestDurationPhone.isEmpty || phoneCallDurations[phoneNumber]! > phoneCallDurations[longestDurationPhone]! {
            longestDurationPhone = phoneNumber
        }
    }
    
    // Step 5: Deduct the total cost for the phone number with the longest duration
    if let longestDurationCost = phoneCallCosts[longestDurationPhone] {
        phoneCallCosts[longestDurationPhone] = 0
    }
    
    // Step 6: Calculate the final bill amount
    let totalBill = phoneCallCosts.values.reduce(0, +)
    
    return totalBill
}

func calculateDurationInSeconds(_ timeString: String) -> Int {
    let components = timeString.components(separatedBy: ":")
    if components.count == 3 {
        if let hours = Int(components[0]), let minutes = Int(components[1]), let seconds = Int(components[2]) {
            return hours * 3600 + minutes * 60 + seconds
        }
    }
    return 0
}

func calculateCost(_ durationInSeconds: Int) -> Int {
    if durationInSeconds < 300 {
        return durationInSeconds * 3
    } else {
        return (durationInSeconds + 59) / 60 * 150
    }
}

// Example usage:
let callLog = """
00:05:01,111-111-111
00:01:07,222-222-222
00:02:30,111-111-111
"""
let billAmount = phoneBill(callLog)
print("Total bill amount: \(billAmount) cents")
