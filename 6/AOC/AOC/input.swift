//
//  input.swift
//  AOC
//
//  Created by Emiel Lensink on 07/12/2022.
//

import Foundation

let input = """
htsslsmstsrrhlrrllqppfnpnzzqtqtjqttslttmvmsmbbnpbbznzjjmrmsrrnjjzczcfcqchcnnhrnrzrnrzzddtrrpjrprbpbwbswsqswqswsqsqffgngtgwtwbtbbhhslsrsmrmffgcgtcgcppnbpnpbnpptcptpltthjhwwlttrrlldzldzzzlssccrfrqfrfdfldfldfdzfdzzcnznwznzqqzpqzqdzzbbslbljlqjjvzjzgzqgqqqvsvffzjfzfmzzrjrhjhrhcrhhtgtmggchggcsggvtttwmmsspmpffzpfpjjnwwnpwwdttcfcmmlblwlvvqrqddcdwcwnnfqnqdnnncggflfdftddtftqthqhrrmsrmsrsffbccjnnjjgddppjmmldllhttqvqzvzrvrsslnlplrprtprtttnvnsvsvzzdndrnnnlznzcnnzwwzjjsnjnwjwqqczqcqwqppqnqqllgblbhhbbzbjzzwjzzrqzqggdppgcgwcclglhhwwgcccgcvvpbbrzzwszsqqjqrrczzvmvpprllsgstsnnnrvvsszgzddzttbccmjccwtccrbccnssdqsdsqqfgqfqbfqfjqqzqqmhmwhwffsjjcjffqmmwjwhjjqttpvvgddzjdddwndwdjdldgdsdmdzmdzmzqqszzcwwwjbbvvlplnpndnddjcjcttrgrggjvjsjvjssnsmshmhrmhhfvvdqqppmbbjnbnzzzwlzzfmmlttvptvpphlhwhzzwffcsfsppdssvsvgsgcscmmdwwpggtcgttmlmglgmmcsccmmgffnvvvvsscstctptzzcmcsclcffnwwndnwddmgmfmvffntfnndgdrrbmrrvprrjnjcnjjsgjgmmjjjqwqhhlfljfljlclttrgttmdmhhcncwncnmccnmnqqmhmwmdwdmdfdttnggcscfsftttcjchhqghhtdthtwtgwgttlffphfhtftpfttlgtltblljmljjsmsszgsghhnnmvnmnvmvmhvvtmmdqdppclplqljllzppwgpgvpvjpvvlwldlcdcmvfrbcqfdrgqjdmpvczgmtrbhtfgbctjghwfmpqtprlnvzvbmhnmgsnbcqpdqhtstncmtrvwmjzzmsbprfvmszgvdwjwchzcvmzncfblffwvwwrdqpfnvrtlftnvhcqpwfgzdnmpqthblmqzhbdbdhmqvscfrpbjbgjgdndhlnnpcrrmrlghcwvmmmhbvdsrztbpdvhwhsphmgblzfpflhnbrvjsgsbvgcfwdlbmbsmbqfwczhhbbwntsczhljgvdwpsfmjppmdwcfchhvtrwlfgqrzbtzndqwbwqflpthhgtzrfmspfnlrrvrjttwnzzfsbzlvfwlntvcqhfntllsrdgqjdbrbvnmjgfsqshmcgtsmlrzjmmqbpfdfhlghqjnjrcnzvvmbwhwfwpbbsmpdmvvznstqpjwmthncjsvfmbhwtbfqgfmvhhwrwzrzccbmmrngfbcqgsdjlfwrlzqwrbhvhmjzqqtgqvjwgllhhgphjthwnscndjfhrdzjctthwfszztvtzcnvsnfdwnvrrbjzplgnghfsvnflhctjntrpzfgjnfzlmwzrvqcfdqqscrffjshhgmvlgdtqpbllfdspdhcccqbmpqcgctljwzdszbfzsltfmdrcvmjqmpvzzhnczlfdbrmsvfffmfzjvnthghqgtnvjtflzrrnrhqshtzslbmbghvtqcmbdgzcmmrpbtqlzbzjhhgfcbrbcztlhdcfqccqsgdqdfrvlsprbhwhtmjfbzlzfpcslcddzdhbhstvqjgdfwdwzfhrzpthnzgmzrrbrszvcwhbdczzcnqsqrwdpmgdmcdmccmfdwdfmzpbbsdtjlmlvcnvhhgcltwmpzqmjlpbsbfrrntrbmrrmgqrdsbfcgnqvnmwwgnmvvpjzpwbvwfzzfcfrbgdshrvbpdlbpzdsvjnrsmfttqgbngjbqcnhhhmrnlgwjnlfcsdwccqqlzcdrcqnjlmsfqldgdmwlctstcvqbvvwvhvrnhvtgpcnsstnhvlttdnstlndnpdglqlbgggqlwqpfztgzvhqqwbctvgtrmrbpmvwlztsfbrmhhpfdtnsjcjmngsqtzvhqjnwmgcrjbhvghpnrjlrhjfrfrmbzvprpzlcshbqtlnlmqmfhsmbznjmpzwljccngbsvqqmghqsqwwmtqhgddnpcmmlfvmplgptzmfsmpntprnwlpjmsdsntpmpnhwlqgfwslrnjlmvhvqsnlcssvrqvtvfhhghbhnvmpngtdmrcmftjmwgnptbmjcwvrqqbczmtdprlltcjcggvffvjwdthbhvjvhbsmfnstqvczmvsgsqfjmddszzrwnbrbvlhgltjddczwpzpsgfgbtmgmssbszhjfbprpbgsqpvgwfnmpcdwfzwbfbtfwhjbjgrctcwqgfhpvjpjssmcpppwpbnlfsrmbzqdpmpmqjtzqmqswpfhfvfltwnfbltvdmfgmpbhzzdrbtnmmjfqgtrgmrbsgplfrmlnjrggtslngnphcvcwvqsdftlhddhpsdwlhzcrfwgwbndplwjmtrltmswwdqjpgmmcdchllzdgpfpfrvqrmvppvzcrvbswzdclnqnqvmfvjtpzpvzlmbngtrrjwpgqjgrrqbqwcvjlgqzddtcfmmrqtnjppqvztfpdrdmjpsqqvzrhwjgvdwwdtmrzrvhwgsqvjjrtsdtwfwhrbcsqdblhgwzghrqrqtfbzszrmjqbhrtsrcfjlzbcjmdnpthrtbhtzmhgpfcqndwpmtlvzschzzcqdnzdrfhczsrscvttlpslrzgvwprwppmpfjqwhtnhzcdjjwmsnvqzmtlzsdpbdtdtsmbmjszsglrldcsgtnmbgsjfmnrftnmvnjtswrmdthvstmdlsnsmrbqhdlpnmnhjhcccgnzrrsljvwswmhjqrrfbwwhgrcttsdcjsdtlgmgblfnvwmgztbbzlbrdnspfnvwvhzlztdhlzhwwppgwwvrhfbjvrmjpjflqzbdnlvptmrsggqmzgmzlsdzbfqnqzzdnzfgmhncvwmgrcfrmlnwzcwdsvtwbvcqpmgcczbnnfdrlsgnfgnpbdstdmwhlprnzvhjpznsgwhfhzfwmjsvcbwccpsnfgbzrltcbwczcmzwljcswgwjnhwtjrjvgrggsrqszscrjcghnwdzpzhttrjcgwvmtcwmrhvwptlgfjpdjpnhphmzdgfdvsncswbdvjdtsgdtlsgjljlczgrwbswtbwrcfpmhgfjfnhpsmfrrtcjmpvvscmgftpprdmbjwcvhzbrmpbvhgzwftwtvvhrjmljgjhbpnbnfntmjhvjrzwlqbtqlrfbblgmfsbgzhhscgwgzrwvflnfctngtwbvdbbgspntclnbwgpppjgbrlqvtfznpdttrsplvjfsgbjwjprbvdfvjtffbhsjwgbsfschfnmlqdfzmdwzvfctjjvzncdvrdttlpvpgvsssflpfnrzgfznzlldrbgnnztngtlbbrmrmlfnnspsvvsfzfbmsblmzdwqcrftvnbvdlhgdqjtglclpzrchtlffrfwslqjvbfpvnhmdgqrcjtbhmjqwqzpfndqbwldbzmwqsptdccczmhwmdqqzcqvmbbnmqndtspmbtggcghdhsfgrjgvwjdbwmltbhdvdtgqnpqhwmhzpzbqjtnlftqrjbsvtwtgpmvpnfwdtsjgdtfnlntpgrmwphphrrzhbdrbzhtqddwvptdllntjzldzrndhfjwdfnmtjmjtfmndbvlwgmlcmwwlpfdjwbfznbllbmqrlmvljngvpmdlqmvdvwvpqwlbqssqcbnrmhdvrzwljstghmhntwsbqmnlpgthbwmrznbbggthtjhnndnqbzmcrtftcbnpctqjzghdfcvmmvpqwtnntstlspfsgwfdbrlsbwgbhhbfcvwrjclsgmmbqmmjwtdjqppjvcbnbvfwczlqzbtnlhzhssglgnlm
"""

