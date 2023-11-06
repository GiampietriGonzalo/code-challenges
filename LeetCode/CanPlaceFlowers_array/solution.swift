final class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        guard !flowerbed.isEmpty else { return false }
        guard flowerbed.count > 1 else {
            let flowersCapacity = flowerbed[0] == 0 ? 1 : 0
            return n <= flowersCapacity
        }

        var zerosCount = 0
        var flowersCapacity = 0

        for i in 0..<flowerbed.count {
            if i == 0, flowerbed[i] == 0 {
                zerosCount = 2
            } else if i == flowerbed.count - 1, flowerbed[i] == 0, zerosCount >= 1 {
               flowersCapacity += 1
            } else {
                if flowerbed[i] == 0 {
                    if zerosCount == 2 {
                        flowersCapacity += 1
                        zerosCount = 1
                    } else {
                        zerosCount += 1
                    }
                } else {
                    zerosCount = 0
                }
            }
        }

        return n <= flowersCapacity
    }
}