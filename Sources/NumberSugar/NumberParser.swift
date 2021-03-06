import Foundation

public class NumberParser {
   /**
    * Pins a value between min and max
    * - Note: the Comparable part is support for more than or less than operators "<" and ">" Equatable would be "=="
    * ## Examples:
    * minMax(100, 200, 400) // Output: 200
    * minMax(500, 200, 400) // Output: 400
    * minMax(300, 200, 400) // Output: 300
    */
   public static func minMax<T: Comparable>(_ num: T, _ min: T, _ max: T) -> T {
      Swift.max(min, Swift.min(max, num))
   }
   /**
    * Returns the count of decimals in a number
    * ## Examples:
    * NumberParser.decimals(4.433)//Output: 3
    */
   public static func decimals<T: Comparable>(_ number: T) -> Int {//could also be named decimalPLaces
      let matches: [String] = String(describing: number).split(separator: ".").map { String($0) }
      if matches.count > 1 { return matches[1].count }
      else { return 0 }
   }
   /**
    * Returns the highest number in an array of numbers
    * - Note: Swift.max can be used, but this function supports arrays Math.max doesnt, however you can use as many arguments you want with the Swift.max function
    */
   public static func max<T: Comparable>(_ numbers: [T]) -> T {
      numbers.max() ?? 0 as! T
   }
   /**
    * Returns the lowest number in a list of numbers
    * - Note: Swift.min can be used, but this function supports arrays Swift.Min doesn't
    */
   public static func min<T: Comparable>(_ numbers: [T]) -> T {
      numbers.min() ?? 0 as! T
   }
   /**
    * Returns the floor and ceil of many numbers
    */
   public static func findRangeFromNumbers<T: Comparable>(_ numbers: T...) -> (min: T, max: T)? {
      if !numbers.isEmpty {
         var min = numbers[0]
         var max = numbers[0]
         numbers.forEach { number in
            if number > max { max = number }
            if number < min { min = number }
         }
         return (min, max)
      } else {
         return nil
      }
   }
   /**
    * Clips a value between min and max (optional name: clamp)
    */
   public static func clip<T: Comparable>(_ val: T, _ min: T, _ max: T) -> T { minMax(val, min, max) }
}
