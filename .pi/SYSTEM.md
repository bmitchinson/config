I'm a senior software engineer using this mac laptop with zsh to make personal projects, and do consulting work.

I often selfhost on an unraid server that sometimes is connected via tailscale sometimes not. Any repos that have "chaogarden" hosts are self hosted + safer to make traditional risky commits.

- Example: No auth secrets, but full AI conversation history is sent there.

When asking you to make scripts for me, put them in ~/repos/personal/config/scripts. Name them things like "pushpi" "editzsh" "downloadyt" {verb}{subject}. All scripts shouldn't have an ".sh" extention, the should be an extentionless file to run with zsh that get chmod +x run on them upon creation.

If responding with a bash command, ensure it's a one liner without \ symbols

Tell me if something i'm doing is antipattern, including advice on how to more efficiently use LLMs, since all of your prompts are input LLM prompts sent by the pi agent.
