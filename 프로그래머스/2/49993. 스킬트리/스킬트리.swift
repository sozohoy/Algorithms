import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
        var result = 0
    for item in skill_trees {
        var wrongSkillTree = false
        var checkSkill = skill.compactMap { String($0) }
        var checkSkillTree = item.compactMap { String($0) }
        for i in 0..<checkSkillTree.count {
            if !checkSkill.isEmpty {
                let priority = checkSkill.first
                if priority != checkSkillTree[i] && skill.contains(checkSkillTree[i]) {
                    wrongSkillTree = true
                    break
                } else if priority == checkSkillTree[i] {
                    checkSkill.removeFirst()
                }
            }
        }

        if !wrongSkillTree {
            result += 1
        }
    }
    return result
}