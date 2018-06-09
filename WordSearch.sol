
pragma solidity ^0.4.1;

contract WordSearch {
  // address that creates contract
  address teacher;

  string[] hashed_words;
  string[] solved_words;
  bool killSwitch;
  uint8 remainingWords;

  function WordSearch(string w1, string w2) {
    teacher = msg.sender;
    hashed_words = [w1, w2];
    solved_words = ['', ''];
    remainingWords = 2;
    killSwitch = false;
  }
  function setKillSwitch(bool state) {
    if (msg.sender == teacher) {
      killSwitch = state;
    }
  }
  function stringsEqual(string storage _a, string memory _b) internal returns (bool) {
		bytes storage a = bytes(_a);
		bytes memory b = bytes(_b);
		if (a.length != b.length)
			return false;
		for (uint i = 0; i < a.length; i ++)
			if (a[i] != b[i])
				return false;
		return true;
	}

  // user submits guess
  function guessWord(string word) returns (bool) {
    bool succeeded;

    if (killSwitch || remainingWords == 0) {
      return false;
    } else {
      var reward = address(this).balance / remainingWords;

      if (stringsEqual(hashed_words[0], word) || stringsEqual(hashed_words[1], word)) {
        if (!stringsEqual(solved_words[0], word) && !stringsEqual(solved_words[1], word)) {
          if (stringsEqual(solved_words[0], '')) {
            solved_words[0] = word;
          } else {
            solved_words[1] = word;
          }
          remainingWords--;
          succeeded = msg.sender.send(reward / 10);
          return succeeded;
        }
      }
    }
  }
}