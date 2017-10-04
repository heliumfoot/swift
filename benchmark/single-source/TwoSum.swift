//===--- TwoSum.swift -----------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

// This test is solves 2SUM problem:
// Given an array and a number C, find elements A and B such that A+B = C
import TestsUtils

public let TwoSum = BenchmarkInfo(
  name: "TwoSum",
  runFunction: run_TwoSum,
  tags: [.validation, .api, .Dictionary, .Array, .algorithm])

let array = [
  959,  81, 670, 727, 416, 171, 401, 398, 707, 596, 200,   9, 414,  98,  43,
  352, 752, 158, 593, 418, 240, 912, 542, 445, 429, 456, 993, 618,  52, 649,
  759, 190, 126, 306, 966,  37, 787, 981, 606, 372, 597, 901, 158, 284, 809,
  820, 173, 538, 644, 428, 932, 967, 962, 959, 233, 467, 220,   8, 729, 889,
  277, 494, 554, 670,  91, 657, 606, 248, 644,   8, 366, 815, 567, 993, 696,
  763, 800, 531, 301, 863, 680, 703, 279, 388, 871, 124, 302, 617, 410, 366,
  813, 599, 543, 508, 336, 312, 212,  86, 524,  64, 641, 533, 207, 893, 146,
  534, 104, 888, 534, 464, 423, 583, 365, 420, 642, 514, 336, 974, 846, 437,
  604, 121, 180, 794, 278, 467, 818, 603, 537, 167, 169, 704,   9, 843, 555,
  154, 598, 566, 676, 682, 828, 128, 875, 445, 918, 505, 393, 571,   3, 406,
  719, 165, 505, 750, 396, 726, 404, 391, 532, 403, 728, 240,  89, 917, 665,
  561, 282, 302, 438, 714,   6, 290, 939, 200, 788, 128, 773, 900, 934, 772,
  130, 884,  60, 870, 812, 750, 349,  35, 155, 905, 595, 806, 771, 443, 304,
  283, 404, 905, 861, 820, 338, 380, 709, 927,  42, 478, 789, 656, 106, 218,
  412, 453, 262, 864, 701, 686, 770,  34, 624, 597, 843, 913, 966, 230, 942,
  112, 991, 299, 669, 399, 630, 943, 934, 448,  62, 745, 917, 397, 440, 286,
  875,  22, 989, 235, 732, 906, 923, 643, 853,  68,  48, 524,  86,  89, 688,
  224, 546,  73, 963, 755, 413, 524, 680, 472,  19, 996,  81, 100, 338, 626,
  911, 358, 887, 242, 159, 731, 494, 985,  83, 597,  98, 270, 909, 828, 988,
  684, 622, 499, 932, 299, 449, 888, 533, 801, 844, 940, 642, 501, 513, 735,
  674, 211, 394, 635, 372, 213, 618, 280, 792, 487, 605, 755, 584, 163, 358,
  249, 784, 153, 166, 685, 264, 457, 677, 824, 391, 830, 310, 629, 591,  62,
  265, 373, 195, 803, 756, 601, 592, 843, 184, 220, 155, 396, 828, 303, 553,
  778, 477, 735, 430,  93, 464, 306, 579, 828, 759, 809, 916, 759, 336, 926,
  776, 111, 746, 217, 585, 441, 928, 236, 959, 417, 268, 200, 231, 181, 228,
  627, 675, 814, 534,  90, 665,   1, 604, 479, 598, 109, 370, 719, 786, 700,
  591, 536,   7, 147, 648, 864, 162, 404, 536, 768, 175, 517, 394,  14, 945,
  865, 490, 630, 963,  49, 904, 277,  16, 349, 301, 840, 817, 590, 738, 357,
  199, 581, 601,  33, 659, 951, 640, 126, 302, 632, 265, 894, 892, 587, 274,
  487, 499, 789, 954, 652, 825, 512, 170, 882, 269, 471, 571, 185, 364, 217,
  427,  38, 715, 950, 808, 270, 746, 830, 501, 264, 581, 211, 466, 970, 395,
  610, 930, 885, 696, 568, 920, 487, 764, 896, 903, 241, 894, 773, 896, 341,
  126,  22, 420, 959, 691, 207, 745, 126, 873, 341, 166, 127, 108, 426, 497,
  681, 796, 430, 367, 363
]

@inline(never)
public func run_TwoSum(_ N: Int) {
  var i1: Int?
  var i2: Int?
  var Dict: Dictionary<Int, Int> = [:]
  for _ in 1...2*N {
    for Sum in 500..<600 {
      Dict = [:]
      i1 = nil
      i2 = nil
      for n in 0..<array.count {
        if let m = Dict[Sum-array[n]] {
          i1 = m
          i2 = n
          break
        }
        Dict[array[n]] = n
      }
      CheckResults(i1 != nil && i2 != nil)
      CheckResults(Sum == array[i1!] + array[i2!])
    }
  }
}
