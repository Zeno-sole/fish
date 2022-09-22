function alias --description 'Creates a function wrapping a command'
    set -l options h/help s/save
    argparse -n alias --max-args=2 $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help alias
        return 0
    end

    set -l name
    set -l body
    set -l prefix
    set -l first_word
    set -l wrapped_cmd

    if not set -q argv[1]
        # Print the known aliases.
        for func in (functions -n)
            set -l output (functions $func | string match -r -- "^function .* --description 'alias (.*)'")
            if set -q output[2]
                set output (string replace -r -- '^'$func'[= ]' '' $output[2])
                echo alias $func (string escape -- $output[1])
            end
        end
        return 0
    else if not set -q argv[2]
        # Alias definition of the form "name=value".
        set -l tmp (string split -m 1 "=" -- $argv) ""
        set name $tmp[1]
        set body $tmp[2]
    else
        # Alias definition of the form "name value".
        set name $argv[1]
        set body $argv[2]
    end

    # sanity check
    if test -z "$name"
        printf ( _ "%s: Name cannot be empty\n") alias
        return 1
    else if test -z "$body"
        printf ( _ "%s: Body cannot be empty\n") alias
        return 1
    end

    # Extract the first command from the body.
    printf '%s\n' $body | read -lt first_word body

    # Prevent the alias from immediately running into an infinite recursion if
    # $body starts with the same command as $name.
    if test $first_word = $name
        if contains $name (builtin --names)
            set prefix builtin
        else
            set prefix command
        end
    end
    set -l cmd_string (string escape -- "alias $argv")
    set wrapped_cmd (string join ' ' -- $first_word $body | string escape)
    echo "function $name --wraps $wrapped_cmd --description $cmd_string; $prefix $first_word $body \$argv; end" | source
    if set -q _flag_save
        funcsave $name
    end
    #echo "function $name --wraps $wrapped_cmd --description $cmd_string; $prefix $first_word $body \$argv; end"
end

alias alias0='something --arg0'
alias alias1='something --arg1'
alias alias2='something --arg2'
alias alias3='something --arg3'
alias alias4='something --arg4'
alias alias5='something --arg5'
alias alias6='something --arg6'
alias alias7='something --arg7'
alias alias8='something --arg8'
alias alias9='something --arg9'
alias alias10='something --arg10'
alias alias11='something --arg11'
alias alias12='something --arg12'
alias alias13='something --arg13'
alias alias14='something --arg14'
alias alias15='something --arg15'
alias alias16='something --arg16'
alias alias17='something --arg17'
alias alias18='something --arg18'
alias alias19='something --arg19'
alias alias20='something --arg20'
alias alias21='something --arg21'
alias alias22='something --arg22'
alias alias23='something --arg23'
alias alias24='something --arg24'
alias alias25='something --arg25'
alias alias26='something --arg26'
alias alias27='something --arg27'
alias alias28='something --arg28'
alias alias29='something --arg29'
alias alias30='something --arg30'
alias alias31='something --arg31'
alias alias32='something --arg32'
alias alias33='something --arg33'
alias alias34='something --arg34'
alias alias35='something --arg35'
alias alias36='something --arg36'
alias alias37='something --arg37'
alias alias38='something --arg38'
alias alias39='something --arg39'
alias alias40='something --arg40'
alias alias41='something --arg41'
alias alias42='something --arg42'
alias alias43='something --arg43'
alias alias44='something --arg44'
alias alias45='something --arg45'
alias alias46='something --arg46'
alias alias47='something --arg47'
alias alias48='something --arg48'
alias alias49='something --arg49'
alias alias50='something --arg50'
alias alias51='something --arg51'
alias alias52='something --arg52'
alias alias53='something --arg53'
alias alias54='something --arg54'
alias alias55='something --arg55'
alias alias56='something --arg56'
alias alias57='something --arg57'
alias alias58='something --arg58'
alias alias59='something --arg59'
alias alias60='something --arg60'
alias alias61='something --arg61'
alias alias62='something --arg62'
alias alias63='something --arg63'
alias alias64='something --arg64'
alias alias65='something --arg65'
alias alias66='something --arg66'
alias alias67='something --arg67'
alias alias68='something --arg68'
alias alias69='something --arg69'
alias alias70='something --arg70'
alias alias71='something --arg71'
alias alias72='something --arg72'
alias alias73='something --arg73'
alias alias74='something --arg74'
alias alias75='something --arg75'
alias alias76='something --arg76'
alias alias77='something --arg77'
alias alias78='something --arg78'
alias alias79='something --arg79'
alias alias80='something --arg80'
alias alias81='something --arg81'
alias alias82='something --arg82'
alias alias83='something --arg83'
alias alias84='something --arg84'
alias alias85='something --arg85'
alias alias86='something --arg86'
alias alias87='something --arg87'
alias alias88='something --arg88'
alias alias89='something --arg89'
alias alias90='something --arg90'
alias alias91='something --arg91'
alias alias92='something --arg92'
alias alias93='something --arg93'
alias alias94='something --arg94'
alias alias95='something --arg95'
alias alias96='something --arg96'
alias alias97='something --arg97'
alias alias98='something --arg98'
alias alias99='something --arg99'
alias alias100='something --arg100'
alias alias101='something --arg101'
alias alias102='something --arg102'
alias alias103='something --arg103'
alias alias104='something --arg104'
alias alias105='something --arg105'
alias alias106='something --arg106'
alias alias107='something --arg107'
alias alias108='something --arg108'
alias alias109='something --arg109'
alias alias110='something --arg110'
alias alias111='something --arg111'
alias alias112='something --arg112'
alias alias113='something --arg113'
alias alias114='something --arg114'
alias alias115='something --arg115'
alias alias116='something --arg116'
alias alias117='something --arg117'
alias alias118='something --arg118'
alias alias119='something --arg119'
alias alias120='something --arg120'
alias alias121='something --arg121'
alias alias122='something --arg122'
alias alias123='something --arg123'
alias alias124='something --arg124'
alias alias125='something --arg125'
alias alias126='something --arg126'
alias alias127='something --arg127'
alias alias128='something --arg128'
alias alias129='something --arg129'
alias alias130='something --arg130'
alias alias131='something --arg131'
alias alias132='something --arg132'
alias alias133='something --arg133'
alias alias134='something --arg134'
alias alias135='something --arg135'
alias alias136='something --arg136'
alias alias137='something --arg137'
alias alias138='something --arg138'
alias alias139='something --arg139'
alias alias140='something --arg140'
alias alias141='something --arg141'
alias alias142='something --arg142'
alias alias143='something --arg143'
alias alias144='something --arg144'
alias alias145='something --arg145'
alias alias146='something --arg146'
alias alias147='something --arg147'
alias alias148='something --arg148'
alias alias149='something --arg149'
alias alias150='something --arg150'
alias alias151='something --arg151'
alias alias152='something --arg152'
alias alias153='something --arg153'
alias alias154='something --arg154'
alias alias155='something --arg155'
alias alias156='something --arg156'
alias alias157='something --arg157'
alias alias158='something --arg158'
alias alias159='something --arg159'
alias alias160='something --arg160'
alias alias161='something --arg161'
alias alias162='something --arg162'
alias alias163='something --arg163'
alias alias164='something --arg164'
alias alias165='something --arg165'
alias alias166='something --arg166'
alias alias167='something --arg167'
alias alias168='something --arg168'
alias alias169='something --arg169'
alias alias170='something --arg170'
alias alias171='something --arg171'
alias alias172='something --arg172'
alias alias173='something --arg173'
alias alias174='something --arg174'
alias alias175='something --arg175'
alias alias176='something --arg176'
alias alias177='something --arg177'
alias alias178='something --arg178'
alias alias179='something --arg179'
alias alias180='something --arg180'
alias alias181='something --arg181'
alias alias182='something --arg182'
alias alias183='something --arg183'
alias alias184='something --arg184'
alias alias185='something --arg185'
alias alias186='something --arg186'
alias alias187='something --arg187'
alias alias188='something --arg188'
alias alias189='something --arg189'
alias alias190='something --arg190'
alias alias191='something --arg191'
alias alias192='something --arg192'
alias alias193='something --arg193'
alias alias194='something --arg194'
alias alias195='something --arg195'
alias alias196='something --arg196'
alias alias197='something --arg197'
alias alias198='something --arg198'
alias alias199='something --arg199'
alias alias200='something --arg200'
alias alias201='something --arg201'
alias alias202='something --arg202'
alias alias203='something --arg203'
alias alias204='something --arg204'
alias alias205='something --arg205'
alias alias206='something --arg206'
alias alias207='something --arg207'
alias alias208='something --arg208'
alias alias209='something --arg209'
alias alias210='something --arg210'
alias alias211='something --arg211'
alias alias212='something --arg212'
alias alias213='something --arg213'
alias alias214='something --arg214'
alias alias215='something --arg215'
alias alias216='something --arg216'
alias alias217='something --arg217'
alias alias218='something --arg218'
alias alias219='something --arg219'
alias alias220='something --arg220'
alias alias221='something --arg221'
alias alias222='something --arg222'
alias alias223='something --arg223'
alias alias224='something --arg224'
alias alias225='something --arg225'
alias alias226='something --arg226'
alias alias227='something --arg227'
alias alias228='something --arg228'
alias alias229='something --arg229'
alias alias230='something --arg230'
alias alias231='something --arg231'
alias alias232='something --arg232'
alias alias233='something --arg233'
alias alias234='something --arg234'
alias alias235='something --arg235'
alias alias236='something --arg236'
alias alias237='something --arg237'
alias alias238='something --arg238'
alias alias239='something --arg239'
alias alias240='something --arg240'
alias alias241='something --arg241'
alias alias242='something --arg242'
alias alias243='something --arg243'
alias alias244='something --arg244'
alias alias245='something --arg245'
alias alias246='something --arg246'
alias alias247='something --arg247'
alias alias248='something --arg248'
alias alias249='something --arg249'
alias alias250='something --arg250'
alias alias251='something --arg251'
alias alias252='something --arg252'
alias alias253='something --arg253'
alias alias254='something --arg254'
alias alias255='something --arg255'
alias alias256='something --arg256'
alias alias257='something --arg257'
alias alias258='something --arg258'
alias alias259='something --arg259'
alias alias260='something --arg260'
alias alias261='something --arg261'
alias alias262='something --arg262'
alias alias263='something --arg263'
alias alias264='something --arg264'
alias alias265='something --arg265'
alias alias266='something --arg266'
alias alias267='something --arg267'
alias alias268='something --arg268'
alias alias269='something --arg269'
alias alias270='something --arg270'
alias alias271='something --arg271'
alias alias272='something --arg272'
alias alias273='something --arg273'
alias alias274='something --arg274'
alias alias275='something --arg275'
alias alias276='something --arg276'
alias alias277='something --arg277'
alias alias278='something --arg278'
alias alias279='something --arg279'
alias alias280='something --arg280'
alias alias281='something --arg281'
alias alias282='something --arg282'
alias alias283='something --arg283'
alias alias284='something --arg284'
alias alias285='something --arg285'
alias alias286='something --arg286'
alias alias287='something --arg287'
alias alias288='something --arg288'
alias alias289='something --arg289'
alias alias290='something --arg290'
alias alias291='something --arg291'
alias alias292='something --arg292'
alias alias293='something --arg293'
alias alias294='something --arg294'
alias alias295='something --arg295'
alias alias296='something --arg296'
alias alias297='something --arg297'
alias alias298='something --arg298'
alias alias299='something --arg299'
alias alias300='something --arg300'
alias alias301='something --arg301'
alias alias302='something --arg302'
alias alias303='something --arg303'
alias alias304='something --arg304'
alias alias305='something --arg305'
alias alias306='something --arg306'
alias alias307='something --arg307'
alias alias308='something --arg308'
alias alias309='something --arg309'
alias alias310='something --arg310'
alias alias311='something --arg311'
alias alias312='something --arg312'
alias alias313='something --arg313'
alias alias314='something --arg314'
alias alias315='something --arg315'
alias alias316='something --arg316'
alias alias317='something --arg317'
alias alias318='something --arg318'
alias alias319='something --arg319'
alias alias320='something --arg320'
alias alias321='something --arg321'
alias alias322='something --arg322'
alias alias323='something --arg323'
alias alias324='something --arg324'
alias alias325='something --arg325'
alias alias326='something --arg326'
alias alias327='something --arg327'
alias alias328='something --arg328'
alias alias329='something --arg329'
alias alias330='something --arg330'
alias alias331='something --arg331'
alias alias332='something --arg332'
alias alias333='something --arg333'
alias alias334='something --arg334'
alias alias335='something --arg335'
alias alias336='something --arg336'
alias alias337='something --arg337'
alias alias338='something --arg338'
alias alias339='something --arg339'
alias alias340='something --arg340'
alias alias341='something --arg341'
alias alias342='something --arg342'
alias alias343='something --arg343'
alias alias344='something --arg344'
alias alias345='something --arg345'
alias alias346='something --arg346'
alias alias347='something --arg347'
alias alias348='something --arg348'
alias alias349='something --arg349'
alias alias350='something --arg350'
alias alias351='something --arg351'
alias alias352='something --arg352'
alias alias353='something --arg353'
alias alias354='something --arg354'
alias alias355='something --arg355'
alias alias356='something --arg356'
alias alias357='something --arg357'
alias alias358='something --arg358'
alias alias359='something --arg359'
alias alias360='something --arg360'
alias alias361='something --arg361'
alias alias362='something --arg362'
alias alias363='something --arg363'
alias alias364='something --arg364'
alias alias365='something --arg365'
alias alias366='something --arg366'
alias alias367='something --arg367'
alias alias368='something --arg368'
alias alias369='something --arg369'
alias alias370='something --arg370'
alias alias371='something --arg371'
alias alias372='something --arg372'
alias alias373='something --arg373'
alias alias374='something --arg374'
alias alias375='something --arg375'
alias alias376='something --arg376'
alias alias377='something --arg377'
alias alias378='something --arg378'
alias alias379='something --arg379'
alias alias380='something --arg380'
alias alias381='something --arg381'
alias alias382='something --arg382'
alias alias383='something --arg383'
alias alias384='something --arg384'
alias alias385='something --arg385'
alias alias386='something --arg386'
alias alias387='something --arg387'
alias alias388='something --arg388'
alias alias389='something --arg389'
alias alias390='something --arg390'
alias alias391='something --arg391'
alias alias392='something --arg392'
alias alias393='something --arg393'
alias alias394='something --arg394'
alias alias395='something --arg395'
alias alias396='something --arg396'
alias alias397='something --arg397'
alias alias398='something --arg398'
alias alias399='something --arg399'
alias alias400='something --arg400'
alias alias401='something --arg401'
alias alias402='something --arg402'
alias alias403='something --arg403'
alias alias404='something --arg404'
alias alias405='something --arg405'
alias alias406='something --arg406'
alias alias407='something --arg407'
alias alias408='something --arg408'
alias alias409='something --arg409'
alias alias410='something --arg410'
alias alias411='something --arg411'
alias alias412='something --arg412'
alias alias413='something --arg413'
alias alias414='something --arg414'
alias alias415='something --arg415'
alias alias416='something --arg416'
alias alias417='something --arg417'
alias alias418='something --arg418'
alias alias419='something --arg419'
alias alias420='something --arg420'
alias alias421='something --arg421'
alias alias422='something --arg422'
alias alias423='something --arg423'
alias alias424='something --arg424'
alias alias425='something --arg425'
alias alias426='something --arg426'
alias alias427='something --arg427'
alias alias428='something --arg428'
alias alias429='something --arg429'
alias alias430='something --arg430'
alias alias431='something --arg431'
alias alias432='something --arg432'
alias alias433='something --arg433'
alias alias434='something --arg434'
alias alias435='something --arg435'
alias alias436='something --arg436'
alias alias437='something --arg437'
alias alias438='something --arg438'
alias alias439='something --arg439'
alias alias440='something --arg440'
alias alias441='something --arg441'
alias alias442='something --arg442'
alias alias443='something --arg443'
alias alias444='something --arg444'
alias alias445='something --arg445'
alias alias446='something --arg446'
alias alias447='something --arg447'
alias alias448='something --arg448'
alias alias449='something --arg449'
alias alias450='something --arg450'
alias alias451='something --arg451'
alias alias452='something --arg452'
alias alias453='something --arg453'
alias alias454='something --arg454'
alias alias455='something --arg455'
alias alias456='something --arg456'
alias alias457='something --arg457'
alias alias458='something --arg458'
alias alias459='something --arg459'
alias alias460='something --arg460'
alias alias461='something --arg461'
alias alias462='something --arg462'
alias alias463='something --arg463'
alias alias464='something --arg464'
alias alias465='something --arg465'
alias alias466='something --arg466'
alias alias467='something --arg467'
alias alias468='something --arg468'
alias alias469='something --arg469'
alias alias470='something --arg470'
alias alias471='something --arg471'
alias alias472='something --arg472'
alias alias473='something --arg473'
alias alias474='something --arg474'
alias alias475='something --arg475'
alias alias476='something --arg476'
alias alias477='something --arg477'
alias alias478='something --arg478'
alias alias479='something --arg479'
alias alias480='something --arg480'
alias alias481='something --arg481'
alias alias482='something --arg482'
alias alias483='something --arg483'
alias alias484='something --arg484'
alias alias485='something --arg485'
alias alias486='something --arg486'
alias alias487='something --arg487'
alias alias488='something --arg488'
alias alias489='something --arg489'
alias alias490='something --arg490'
alias alias491='something --arg491'
alias alias492='something --arg492'
alias alias493='something --arg493'
alias alias494='something --arg494'
alias alias495='something --arg495'
alias alias496='something --arg496'
alias alias497='something --arg497'
alias alias498='something --arg498'
alias alias499='something --arg499'
alias alias500='something --arg500'
alias alias501='something --arg501'
alias alias502='something --arg502'
alias alias503='something --arg503'
alias alias504='something --arg504'
alias alias505='something --arg505'
alias alias506='something --arg506'
alias alias507='something --arg507'
alias alias508='something --arg508'
alias alias509='something --arg509'
alias alias510='something --arg510'
alias alias511='something --arg511'
alias alias512='something --arg512'
alias alias513='something --arg513'
alias alias514='something --arg514'
alias alias515='something --arg515'
alias alias516='something --arg516'
alias alias517='something --arg517'
alias alias518='something --arg518'
alias alias519='something --arg519'
alias alias520='something --arg520'
alias alias521='something --arg521'
alias alias522='something --arg522'
alias alias523='something --arg523'
alias alias524='something --arg524'
alias alias525='something --arg525'
alias alias526='something --arg526'
alias alias527='something --arg527'
alias alias528='something --arg528'
alias alias529='something --arg529'
alias alias530='something --arg530'
alias alias531='something --arg531'
alias alias532='something --arg532'
alias alias533='something --arg533'
alias alias534='something --arg534'
alias alias535='something --arg535'
alias alias536='something --arg536'
alias alias537='something --arg537'
alias alias538='something --arg538'
alias alias539='something --arg539'
alias alias540='something --arg540'
alias alias541='something --arg541'
alias alias542='something --arg542'
alias alias543='something --arg543'
alias alias544='something --arg544'
alias alias545='something --arg545'
alias alias546='something --arg546'
alias alias547='something --arg547'
alias alias548='something --arg548'
alias alias549='something --arg549'
alias alias550='something --arg550'
alias alias551='something --arg551'
alias alias552='something --arg552'
alias alias553='something --arg553'
alias alias554='something --arg554'
alias alias555='something --arg555'
alias alias556='something --arg556'
alias alias557='something --arg557'
alias alias558='something --arg558'
alias alias559='something --arg559'
alias alias560='something --arg560'
alias alias561='something --arg561'
alias alias562='something --arg562'
alias alias563='something --arg563'
alias alias564='something --arg564'
alias alias565='something --arg565'
alias alias566='something --arg566'
alias alias567='something --arg567'
alias alias568='something --arg568'
alias alias569='something --arg569'
alias alias570='something --arg570'
alias alias571='something --arg571'
alias alias572='something --arg572'
alias alias573='something --arg573'
alias alias574='something --arg574'
alias alias575='something --arg575'
alias alias576='something --arg576'
alias alias577='something --arg577'
alias alias578='something --arg578'
alias alias579='something --arg579'
alias alias580='something --arg580'
alias alias581='something --arg581'
alias alias582='something --arg582'
alias alias583='something --arg583'
alias alias584='something --arg584'
alias alias585='something --arg585'
alias alias586='something --arg586'
alias alias587='something --arg587'
alias alias588='something --arg588'
alias alias589='something --arg589'
alias alias590='something --arg590'
alias alias591='something --arg591'
alias alias592='something --arg592'
alias alias593='something --arg593'
alias alias594='something --arg594'
alias alias595='something --arg595'
alias alias596='something --arg596'
alias alias597='something --arg597'
alias alias598='something --arg598'
alias alias599='something --arg599'
alias alias600='something --arg600'
alias alias601='something --arg601'
alias alias602='something --arg602'
alias alias603='something --arg603'
alias alias604='something --arg604'
alias alias605='something --arg605'
alias alias606='something --arg606'
alias alias607='something --arg607'
alias alias608='something --arg608'
alias alias609='something --arg609'
alias alias610='something --arg610'
alias alias611='something --arg611'
alias alias612='something --arg612'
alias alias613='something --arg613'
alias alias614='something --arg614'
alias alias615='something --arg615'
alias alias616='something --arg616'
alias alias617='something --arg617'
alias alias618='something --arg618'
alias alias619='something --arg619'
alias alias620='something --arg620'
alias alias621='something --arg621'
alias alias622='something --arg622'
alias alias623='something --arg623'
alias alias624='something --arg624'
alias alias625='something --arg625'
alias alias626='something --arg626'
alias alias627='something --arg627'
alias alias628='something --arg628'
alias alias629='something --arg629'
alias alias630='something --arg630'
alias alias631='something --arg631'
alias alias632='something --arg632'
alias alias633='something --arg633'
alias alias634='something --arg634'
alias alias635='something --arg635'
alias alias636='something --arg636'
alias alias637='something --arg637'
alias alias638='something --arg638'
alias alias639='something --arg639'
alias alias640='something --arg640'
alias alias641='something --arg641'
alias alias642='something --arg642'
alias alias643='something --arg643'
alias alias644='something --arg644'
alias alias645='something --arg645'
alias alias646='something --arg646'
alias alias647='something --arg647'
alias alias648='something --arg648'
alias alias649='something --arg649'
alias alias650='something --arg650'
alias alias651='something --arg651'
alias alias652='something --arg652'
alias alias653='something --arg653'
alias alias654='something --arg654'
alias alias655='something --arg655'
alias alias656='something --arg656'
alias alias657='something --arg657'
alias alias658='something --arg658'
alias alias659='something --arg659'
alias alias660='something --arg660'
alias alias661='something --arg661'
alias alias662='something --arg662'
alias alias663='something --arg663'
alias alias664='something --arg664'
alias alias665='something --arg665'
alias alias666='something --arg666'
alias alias667='something --arg667'
alias alias668='something --arg668'
alias alias669='something --arg669'
alias alias670='something --arg670'
alias alias671='something --arg671'
alias alias672='something --arg672'
alias alias673='something --arg673'
alias alias674='something --arg674'
alias alias675='something --arg675'
alias alias676='something --arg676'
alias alias677='something --arg677'
alias alias678='something --arg678'
alias alias679='something --arg679'
alias alias680='something --arg680'
alias alias681='something --arg681'
alias alias682='something --arg682'
alias alias683='something --arg683'
alias alias684='something --arg684'
alias alias685='something --arg685'
alias alias686='something --arg686'
alias alias687='something --arg687'
alias alias688='something --arg688'
alias alias689='something --arg689'
alias alias690='something --arg690'
alias alias691='something --arg691'
alias alias692='something --arg692'
alias alias693='something --arg693'
alias alias694='something --arg694'
alias alias695='something --arg695'
alias alias696='something --arg696'
alias alias697='something --arg697'
alias alias698='something --arg698'
alias alias699='something --arg699'
alias alias700='something --arg700'
alias alias701='something --arg701'
alias alias702='something --arg702'
alias alias703='something --arg703'
alias alias704='something --arg704'
alias alias705='something --arg705'
alias alias706='something --arg706'
alias alias707='something --arg707'
alias alias708='something --arg708'
alias alias709='something --arg709'
alias alias710='something --arg710'
alias alias711='something --arg711'
alias alias712='something --arg712'
alias alias713='something --arg713'
alias alias714='something --arg714'
alias alias715='something --arg715'
alias alias716='something --arg716'
alias alias717='something --arg717'
alias alias718='something --arg718'
alias alias719='something --arg719'
alias alias720='something --arg720'
alias alias721='something --arg721'
alias alias722='something --arg722'
alias alias723='something --arg723'
alias alias724='something --arg724'
alias alias725='something --arg725'
alias alias726='something --arg726'
alias alias727='something --arg727'
alias alias728='something --arg728'
alias alias729='something --arg729'
alias alias730='something --arg730'
alias alias731='something --arg731'
alias alias732='something --arg732'
alias alias733='something --arg733'
alias alias734='something --arg734'
alias alias735='something --arg735'
alias alias736='something --arg736'
alias alias737='something --arg737'
alias alias738='something --arg738'
alias alias739='something --arg739'
alias alias740='something --arg740'
alias alias741='something --arg741'
alias alias742='something --arg742'
alias alias743='something --arg743'
alias alias744='something --arg744'
alias alias745='something --arg745'
alias alias746='something --arg746'
alias alias747='something --arg747'
alias alias748='something --arg748'
alias alias749='something --arg749'
alias alias750='something --arg750'
alias alias751='something --arg751'
alias alias752='something --arg752'
alias alias753='something --arg753'
alias alias754='something --arg754'
alias alias755='something --arg755'
alias alias756='something --arg756'
alias alias757='something --arg757'
alias alias758='something --arg758'
alias alias759='something --arg759'
alias alias760='something --arg760'
alias alias761='something --arg761'
alias alias762='something --arg762'
alias alias763='something --arg763'
alias alias764='something --arg764'
alias alias765='something --arg765'
alias alias766='something --arg766'
alias alias767='something --arg767'
alias alias768='something --arg768'
alias alias769='something --arg769'
alias alias770='something --arg770'
alias alias771='something --arg771'
alias alias772='something --arg772'
alias alias773='something --arg773'
alias alias774='something --arg774'
alias alias775='something --arg775'
alias alias776='something --arg776'
alias alias777='something --arg777'
alias alias778='something --arg778'
alias alias779='something --arg779'
alias alias780='something --arg780'
alias alias781='something --arg781'
alias alias782='something --arg782'
alias alias783='something --arg783'
alias alias784='something --arg784'
alias alias785='something --arg785'
alias alias786='something --arg786'
alias alias787='something --arg787'
alias alias788='something --arg788'
alias alias789='something --arg789'
alias alias790='something --arg790'
alias alias791='something --arg791'
alias alias792='something --arg792'
alias alias793='something --arg793'
alias alias794='something --arg794'
alias alias795='something --arg795'
alias alias796='something --arg796'
alias alias797='something --arg797'
alias alias798='something --arg798'
alias alias799='something --arg799'
alias alias800='something --arg800'
alias alias801='something --arg801'
alias alias802='something --arg802'
alias alias803='something --arg803'
alias alias804='something --arg804'
alias alias805='something --arg805'
alias alias806='something --arg806'
alias alias807='something --arg807'
alias alias808='something --arg808'
alias alias809='something --arg809'
alias alias810='something --arg810'
alias alias811='something --arg811'
alias alias812='something --arg812'
alias alias813='something --arg813'
alias alias814='something --arg814'
alias alias815='something --arg815'
alias alias816='something --arg816'
alias alias817='something --arg817'
alias alias818='something --arg818'
alias alias819='something --arg819'
alias alias820='something --arg820'
alias alias821='something --arg821'
alias alias822='something --arg822'
alias alias823='something --arg823'
alias alias824='something --arg824'
alias alias825='something --arg825'
alias alias826='something --arg826'
alias alias827='something --arg827'
alias alias828='something --arg828'
alias alias829='something --arg829'
alias alias830='something --arg830'
alias alias831='something --arg831'
alias alias832='something --arg832'
alias alias833='something --arg833'
alias alias834='something --arg834'
alias alias835='something --arg835'
alias alias836='something --arg836'
alias alias837='something --arg837'
alias alias838='something --arg838'
alias alias839='something --arg839'
alias alias840='something --arg840'
alias alias841='something --arg841'
alias alias842='something --arg842'
alias alias843='something --arg843'
alias alias844='something --arg844'
alias alias845='something --arg845'
alias alias846='something --arg846'
alias alias847='something --arg847'
alias alias848='something --arg848'
alias alias849='something --arg849'
alias alias850='something --arg850'
alias alias851='something --arg851'
alias alias852='something --arg852'
alias alias853='something --arg853'
alias alias854='something --arg854'
alias alias855='something --arg855'
alias alias856='something --arg856'
alias alias857='something --arg857'
alias alias858='something --arg858'
alias alias859='something --arg859'
alias alias860='something --arg860'
alias alias861='something --arg861'
alias alias862='something --arg862'
alias alias863='something --arg863'
alias alias864='something --arg864'
alias alias865='something --arg865'
alias alias866='something --arg866'
alias alias867='something --arg867'
alias alias868='something --arg868'
alias alias869='something --arg869'
alias alias870='something --arg870'
alias alias871='something --arg871'
alias alias872='something --arg872'
alias alias873='something --arg873'
alias alias874='something --arg874'
alias alias875='something --arg875'
alias alias876='something --arg876'
alias alias877='something --arg877'
alias alias878='something --arg878'
alias alias879='something --arg879'
alias alias880='something --arg880'
alias alias881='something --arg881'
alias alias882='something --arg882'
alias alias883='something --arg883'
alias alias884='something --arg884'
alias alias885='something --arg885'
alias alias886='something --arg886'
alias alias887='something --arg887'
alias alias888='something --arg888'
alias alias889='something --arg889'
alias alias890='something --arg890'
alias alias891='something --arg891'
alias alias892='something --arg892'
alias alias893='something --arg893'
alias alias894='something --arg894'
alias alias895='something --arg895'
alias alias896='something --arg896'
alias alias897='something --arg897'
alias alias898='something --arg898'
alias alias899='something --arg899'
alias alias900='something --arg900'
alias alias901='something --arg901'
alias alias902='something --arg902'
alias alias903='something --arg903'
alias alias904='something --arg904'
alias alias905='something --arg905'
alias alias906='something --arg906'
alias alias907='something --arg907'
alias alias908='something --arg908'
alias alias909='something --arg909'
alias alias910='something --arg910'
alias alias911='something --arg911'
alias alias912='something --arg912'
alias alias913='something --arg913'
alias alias914='something --arg914'
alias alias915='something --arg915'
alias alias916='something --arg916'
alias alias917='something --arg917'
alias alias918='something --arg918'
alias alias919='something --arg919'
alias alias920='something --arg920'
alias alias921='something --arg921'
alias alias922='something --arg922'
alias alias923='something --arg923'
alias alias924='something --arg924'
alias alias925='something --arg925'
alias alias926='something --arg926'
alias alias927='something --arg927'
alias alias928='something --arg928'
alias alias929='something --arg929'
alias alias930='something --arg930'
alias alias931='something --arg931'
alias alias932='something --arg932'
alias alias933='something --arg933'
alias alias934='something --arg934'
alias alias935='something --arg935'
alias alias936='something --arg936'
alias alias937='something --arg937'
alias alias938='something --arg938'
alias alias939='something --arg939'
alias alias940='something --arg940'
alias alias941='something --arg941'
alias alias942='something --arg942'
alias alias943='something --arg943'
alias alias944='something --arg944'
alias alias945='something --arg945'
alias alias946='something --arg946'
alias alias947='something --arg947'
alias alias948='something --arg948'
alias alias949='something --arg949'
alias alias950='something --arg950'
alias alias951='something --arg951'
alias alias952='something --arg952'
alias alias953='something --arg953'
alias alias954='something --arg954'
alias alias955='something --arg955'
alias alias956='something --arg956'
alias alias957='something --arg957'
alias alias958='something --arg958'
alias alias959='something --arg959'
alias alias960='something --arg960'
alias alias961='something --arg961'
alias alias962='something --arg962'
alias alias963='something --arg963'
alias alias964='something --arg964'
alias alias965='something --arg965'
alias alias966='something --arg966'
alias alias967='something --arg967'
alias alias968='something --arg968'
alias alias969='something --arg969'
alias alias970='something --arg970'
alias alias971='something --arg971'
alias alias972='something --arg972'
alias alias973='something --arg973'
alias alias974='something --arg974'
alias alias975='something --arg975'
alias alias976='something --arg976'
alias alias977='something --arg977'
alias alias978='something --arg978'
alias alias979='something --arg979'
alias alias980='something --arg980'
alias alias981='something --arg981'
alias alias982='something --arg982'
alias alias983='something --arg983'
alias alias984='something --arg984'
alias alias985='something --arg985'
alias alias986='something --arg986'
alias alias987='something --arg987'
alias alias988='something --arg988'
alias alias989='something --arg989'
alias alias990='something --arg990'
alias alias991='something --arg991'
alias alias992='something --arg992'
alias alias993='something --arg993'
alias alias994='something --arg994'
alias alias995='something --arg995'
alias alias996='something --arg996'
alias alias997='something --arg997'
alias alias998='something --arg998'
alias alias999='something --arg999'
alias alias1000='something --arg1000'
alias alias1001='something --arg1001'
alias alias1002='something --arg1002'
alias alias1003='something --arg1003'
alias alias1004='something --arg1004'
alias alias1005='something --arg1005'
alias alias1006='something --arg1006'
alias alias1007='something --arg1007'
alias alias1008='something --arg1008'
alias alias1009='something --arg1009'
alias alias1010='something --arg1010'
alias alias1011='something --arg1011'
alias alias1012='something --arg1012'
alias alias1013='something --arg1013'
alias alias1014='something --arg1014'
alias alias1015='something --arg1015'
alias alias1016='something --arg1016'
alias alias1017='something --arg1017'
alias alias1018='something --arg1018'
alias alias1019='something --arg1019'
alias alias1020='something --arg1020'
alias alias1021='something --arg1021'
alias alias1022='something --arg1022'
alias alias1023='something --arg1023'

