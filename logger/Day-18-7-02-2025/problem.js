class Heap {
  constructor(compareFn) {
    this.compareFn = compareFn
    this.items = []
  }

  getLeftChildIndex(index) {
    return 2 * index + 1
  }

  getRightChildIndex(index) {
    return 2 * index + 2
  }

  getParentIndex(index) {
    return Math.floor((index - 1) / 2)
  }

  hasLeftChild(index) {
    return this.getLeftChildIndex(index) < this.items.length
  }

  hasRightChild(index) {
    return this.getRightChildIndex(index) < this.items.length
  }

  hasParent(index) {
    return this.getParentIndex(index) >= 0
  }

  leftChild(index) {
    return this.items[this.getLeftChildIndex(index)]
  }

  rightChild(index) {
    return this.items[this.getRightChildIndex(index)]
  }

  parent(index) {
    return this.items[this.getParentIndex(index)]
  }

  length() {
    return this.items.length
  }

  swap(index1, index2) {
    const temp = this.items[index1]
    this.items[index1] = this.items[index2]
    this.items[index2] = temp
  }

  peek() {
    return this.items[0]
  }

  pop() {
    if (this.items.length === 0) {
      return null
    }
    if (this.items.length === 1) {
      return this.items.pop()
    }
    const item = this.items[0]
    this.items[0] = this.items.pop()
    this.heapifyDown()
    return item
  }

  push(item) {
    this.items.push(item)
    this.heapifyUp()
  }

  remove(item) {
    const index = this.items.indexOf(item)
    if (index === -1) {
      return false
    }
    this.items[index] = this.items[this.items.length - 1]
    this.items.pop()
    this.heapifyDown(index)
    return true
  }

  heapifyUp(index) {
    let currentIndex = index || this.items.length - 1
    while (
      this.hasParent(currentIndex) &&
      this.compareFn(this.items[currentIndex], this.parent(currentIndex)) < 0
    ) {
      this.swap(currentIndex, this.getParentIndex(currentIndex))
      currentIndex = this.getParentIndex(currentIndex)
    }
  }

  heapifyDown(index) {
    // Start at the index passed in or the root if not provided
    let currentIndex = index || 0
    // While the current index has a left child
    while (this.hasLeftChild(currentIndex)) {
      // Find the smaller child index between the left and right children
      let smallerChildIndex = this.getLeftChildIndex(currentIndex)
      if (
        this.hasRightChild(currentIndex) &&
        this.compareFn(
          this.rightChild(currentIndex),
          this.leftChild(currentIndex)
        ) < 0
      ) {
        smallerChildIndex = this.getRightChildIndex(currentIndex)
      }
      // If the current item is smaller than the smaller child, we're done
      if (
        this.compareFn(
          this.items[currentIndex],
          this.items[smallerChildIndex]
        ) < 0
      ) {
        break
      }
      // Otherwise, swap the current item with the smaller child and continue
      this.swap(currentIndex, smallerChildIndex)
      currentIndex = smallerChildIndex
    }
  }
}
/*class Job {
  constructor(start, end, cpuLoad) {
    this.start = start;
    this.end = end;
    this.cpuLoad = cpuLoad;
  }
}*/
class Solution {
  findMaxCPULoad(jobs) {
    let maxCPULoad = 0
    let current_load = 0
    let min_heap = new Heap((a, b) => a.end - b.end)
    jobs.sort((a, b) => a.start - b.start)

    for (let job of jobs) {
      while (min_heap.length() != 0 && min_heap.peek().end < job.start) {
        current_load -= min_heap.peek().cpuLoad
        min_heap.pop()
      }
      min_heap.push(job)
      current_load += job.cpuLoad
      if (current_load > maxCPULoad) maxCPULoad = current_load
    }
    return maxCPULoad
  }

  findEmployeeFreeTime(schedules) {
    let freeSpaces = []
    let max_end_work = null
    let works = []
    for (let schedule of schedules) {
      for (let work of schedule) {
        works.push(work)
      }
    }
    works.sort((a, b) => a.start - b.start)
    console.log(works)
    for (let work of works) {
      console.log(` for look MEW ${max_end_work} work ${work}`)
      if (max_end_work != null && max_end_work.end < work.start) {
        console.log(`MEW ${max_end_work} work ${work}`)
        let free_interval = new Interval(max_end_work.end, work.start)
        freeSpaces.push(free_interval)
      }
      if (max_end_work == null || max_end_work.end < work.end) {
        max_end_work = work
      }
    }
    return freeSpaces
  }
}



class Interval {
  constructor(start, end) {
    this.start = start;
    this.end = end;
  }
}

let solution = new Solution()
hours = [
  [
    [1, 3],
    [5, 6],
  ],
  [
    [2, 3],
    [6, 8],
  ],]
let temps = []
for(let hour of hours){
    let s = []
    for(let h of hour){
        let i = new Interval(h[0],h[1])
        s.push(i)
    }
    temps.push(s)
}  
console.log(solution.findEmployeeFreeTime(temps))