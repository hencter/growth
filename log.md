# Nova 知识库 — 时间线日志

> 仅追加。永不删除条目。最新条目在最前。可搜索格式：用 grep 工具搜索 `^## \[` 模式，读取末尾 20 行

---

## [2026-10-05] fix | 学习者主张含「方向相反」的事实错误（Rust 起源）→ 当场查源更正 → [[investigation-before-judgement]]

**事件**：Q2 回答中，学习者以「Rust 源于 **C 语言之父**的设计初衷，旨在为**云原生时代**构建更适用的语言」作为选型理由。
**核实（实测抓取 Rust / Go / C 维基条目）**：①Rust 由 **Graydon Hoare 于 2006 年在 Mozilla** 创造（2009 官方资助，2015 发布 1.0），与 C 之父 **Dennis Ritchie** 无关；②**Ken Thompson（C 时代传奇）在 Go 的设计团队**（Griesemer/Pike/Thompson，2009-11-10）——**他的说法方向正好相反**；③Rust 的设计目标是**性能/类型安全/并发/内存安全且不用 GC**，不是"云原生"（该词晚于该语言，早期场景是 Servo 浏览器引擎）。
**性质（不夸大也不轻放）**：这**不是判断错误**——同一次回答里「Go 的 GC 机制不理想」是对的、crates 跨形态分包也是真的；暴露的是**独立短板：证据纪律**。判断他已有，引用来源前先核对需要练。
**处置**：
1. ADR-001 内加「Q2 记录与事实更正」块（逐条列：哪条错、哪条对、哪条未获支持），并保留「招聘 Rust 程序员更具可行性」为**未获支持且方向可能相反**的待证据主张；
2. 载体升格到既有概念笔记 [[investigation-before-judgement|Investigation Before Judgement]]，写入本案（authority claim 类断言是溯源收益最高的目标）+ 训练动作：每条主张标 **[查过源]/[印象]/[推断]**；
3. 运行单新增「靶场记录：证据纪律」，明确本轮训练目标随之为证据纪律；下一问改为 **Q3 溯源**。
**意义**：这是本会话第一次出现**可核查的事实错误**——它把「能判断」与「证据纪律」区分开来。评估据此更新：能判断仍 ✅（附注：含一处事实错误），新增跟踪项「证据纪律 ⚠️」。
## [2026-10-05] ingest | 拷问 Q1 已答：备选栏填齐，并提炼出学习者的原创架构属性 → [[builder-verifiability]]

**他答的（Q1，原话要点）**：比较过 Python——生态好，但**缩进语法对 AI 不友好**（难判代码层级）、**解释型产生大量冗余文件**；选 Rust 是因为**编译期报错/警告让 AI 清晰感知、明确下一步操作**；判断「未来也不太可能推翻」。
**评估**：备选方案以**代价形式**给出（合格）；**能判断**的证据再加强（比较后取舍，而非偏好）。**文档不一致（FastAPI vs Rust）他未答 → 转为 Q2。**
**产出**：
1. ADR-001 的 `Alternatives` 栏填齐（Python 被否的两条原因 + Rust 的三条买入），并加注「这一栏证明决策是比较后的取舍」。
2. 新建 [[builder-verifiability|Builder-Verifiability（建造者可验证性）]]——**学习者的原创洞见**：当第一建造者是 AI 代理时，**工具链的错误信号质量本身就是架构属性**（结构是否显式 / 错误信号质量 / 产物信息密度），可度量为「每次修复平均 token、首次通过率、平均重试次数」。
3. 本库合成（标注为推断）：他两条回答其实**同一个模型**——信号强 → 少猜少试 → 边际 token 低 → 用户量增长时成本曲线更平（正是他说"先坏"的地方）。即：**第 1 条不是性能选择，而是成本选择的上游**。
4. 边界写清：建造者是人 / 代理能可靠推断隐式结构 / 运行量远大于编写量 / 生态缺件需自研 → 该属性权重下降或反转。
**下一问**：Q2——那份写着 FastAPI 的架构文档怎么处理（更新 / 标 superseded / 不处理）。
**管线**：learning 20 篇 = hub 20；严格构建 0 警告。
## [2026-10-05] session | S-1 完成：评估依据他的三条回答（3 ✅ / 1 🔄 / 1 ⬜）；主要矛盾更新 → [[architecture-vocabulary-from-your-answers]]

**他交的三个回答（第一手原话要点）**：①论坛改起来累，选型选了 Rust，**主动接受**生态不完善带来的 token 代价；②100→1000 先坏的不是运行（Rust 内存 200MB），而是**边际成本**——发帖触发 Agent 回复使 token 激增，对象存储成本日增导致媒体看不见；③加私信先动通知，**硬约束＝一定能触达用户**，备选＝公众号/站内/邮件，分阶段＝邮件先行。
**评估（依据他的表达，非作业）**：能提问 ✅（自问「最佳通知方案」）· 能判断 ✅（**两条纠正我的读法**）· 能迁移 🔄（三条都在他自己系统内，跨情境样本待补）· 能教 ⬜ · 知边界 ✅（三次主动自报）。**1/5 → 3/5（+1 部分）**。
**我错在哪（已记录，不辩解）**：我把「先坏」判断成算力侧（协调层 / 向量检索），他给出**成本侧**更接近真相的答案；我把私信判断成先动数据模型，他指出先动通知（触达决定价值）。教训入库：**算力变便宜时，架构约束会转移到经济侧**。
**产出**：`learning/architecture-vocabulary-from-your-answers.md` —— 把他的三条回答逐条翻成标准词汇（架构决策 / 权衡 / 显式接受代价 / 质量属性 / 反馈回路 / 敏感点·风险点 / 硬约束 / 备选方案 / 分阶段），并给出结论：**他缺的是词汇、框架与书面辩护，不是判断力**。
**主要矛盾更新**：熟悉感 vs 可迁移能力 → **口头判断 vs 书面可辩护**。
**下一轮唯一硬产出**：把他第 1 条回答写成 1 页 ADR（他已说出约 80%）→ 我按 `grill-me` 逐条拷问。
**副产品**：他自问的「最佳通知方案」是真实待研究问题，可作下一个 RDEP 运行（硬约束＝一定能触达；备选＝公众号/站内/邮件；分阶段＝邮件先行）。
**管线核对**：learning 18 篇 = hub 声称 18 = 首页卡片 18；严格构建 0 警告；站点 watcher 已自动重建。
## [2026-10-05] ingest | 第一课开跑：用他自己的系统教「什么算架构」→ [[architecture-what-counts]]

**他给的（首个真正的起点信号）**：对象＝**架构**；状态＝**「我不懂架构」**；请求＝**从头教我**。按评估规则判定为**部分充分**——对象与真实情境有了，**属于他自己的问题还没有**。
**investigation-first 落地（先调查，后开口）**：读了他两份**原始**架构文档（`论坛社区项目生态系统架构图.md`、`智能体论坛系统架构框架.md`，只读未改），据此产出第一课第四节「把镜头对准你自己的系统」——部件识别（界面 / 网关 / 协调管理层 / 五类智能体 / 数据与知识层）· 已做的四项权衡（中心协调、池化集群、多存储、合规）· 三问的**示范解读**（最贵改动＝数据归属；10× 先坏＝协调层与向量检索；加「私信」＝数据模型＋权限＋通知＋路由＋前端，而**「要不要新增一类私信智能体」才是架构决策**），并**明确邀请他反驳**。
**教法**：类比（承重墙）→ 三句话最小定义 → 用他的系统做示范 → 三问；术语当场定义、不给菜单、不给 12 周计划；**反驳我比听懂我更有价值**。
**关键判断**：他**已经有架构文档**却自述不懂架构——两头都真。差别在「文档存在」与「他能辩护」之间；因此教学入口选在**能辩护／能推翻**，而不是名词定义。
**运行单更新**：`rdep_field` → 「软件/系统架构（自述不懂，请求从头教）」；`rdep_next` → 「等他一件事：反驳我一处解读，或回答第一课三问中任意一问」；S-1 产出与「知边界」证据同步（**两次主动自报，样本=2**）。管线核对：learning/ **17 篇** = hub 声称 17 = 首页卡片 17；严格构建 0 警告。
## [2026-10-05] fix | 连续三次「替学习者选目标」→ 补 S-1 起点诊断与评估规则；撤回 ADR 运行 → [[rapid-domain-entry-protocol]]

**用户原话**：「你如果要验证我的学习，**只需要对我的回答进行分析即可，如果不足，如实说**，比如你现在写了一个 ADR，**ADR 是什么我都不知道**」。
**根因（自我批评，不辩解）**：把「让学习发生」错当成「让产物出现」。三次同类错误——①用考试味菜单让他选领域 ②再用选项菜单选「小东西」 ③用我自己挑的术语（ADR）搭运行单：**都是我替他做选择**。缺的是规则，不是意愿。
**修复**：
1. RDEP 新增 **S-1 起点诊断**：开放问题、不出菜单、记录学习者原话，拿到之前不许设计运行；「你决定吧」判定为**不合格答案**。
2. RDEP 新增 **评估规则**：评估只依据学习者的表达（提问 / 判断 / 解释 / 承认不懂），**不把「完成我派的作业」当作学习证据**；不足就如实说不足；单次自报标为低样本。
3. RDEP 新增 **不引入未校准术语**：他说不出自己话解释的术语，先问或先教，**不得**用来搭运行单（ADR 事件即为此）。
4. 运行单重写为 **S-1 诊断运行单**（ADR 版撤回，撤回理由与证据写在页内）；五条标准自检：**知边界 = ✅（样本=1）**，能提问/能判断/能迁移/能教 = ⬜ 无证据。
5. 技能启动：`criticism-self-criticism`（按规程输出结构化审视报告）· `investigation-first`（补上本该先做的诊断）· 连同此前已载的 `contradiction-analysis` / `practice-cognition` / `grill-me`，共 5 个技能在会话内实际加载。
**台账**：[[promotions|Promotion Ledger]] 追加一行（S-1 与评估规则）。
## [2026-10-05] session | 方法验证跑启动：ADR 作为首个可验证对象（五条标准 + 技能路由） → [[system-architect-t1-sprint]]

**用户三条指令（已固化）**：①学习是为了**真正学会**，不为考试；②过程中**尽可能启动 skills**；③先拿一个**小东西**跑通「五条标准」以验证方法本身。

**产出**：
1. 运行单重写为 **ADR 方法验证跑**：3.5 h / 48 h，S0–S6 七阶段，每阶段带 `skills` 字段（开工前必须用 `skill` 工具真的加载）；新增 **`rdep_mastery` 五条标准自检**（能提问/能判断/能迁移/能教/知边界），任一不过结论即为「熟悉」而非「学会」。
2. 站点看板新增两块渲染：**每阶段技能路由**（`先加载 skills：…`）与**五条标准自检**——数据全部来自笔记 frontmatter，改一行即更新。
3. [[learning|学习中枢]] 新增「进行中的运行」段，运行单接入图谱（此前该页零入链）。
4. RDEP 加固：S0 反模式（目标由用途定）+ 五条行为标准 + 每阶段技能路由表（上一轮已落，本轮补齐运行单侧）。

**引用核实**：ADR 原始出处（Michael Nygard 2011）与 `adr.github.io` 均**实测 HTTP 200 并读了原文**（四段结构、`We will …` 主动语态、1–2 页、superseded 保留旧记录）；上一版引用的 **SEI ATAM 页面实测取不到 → 撤除引用**（不核实不引用）。

**技能实际启动记录**：`contradiction-analysis`（已产出结构化矛盾分析：主要矛盾＝「熟悉感 vs 可迁移的能力」，非对抗性，对策＝行为标准+阶段闸门+真实靶子）· `practice-cognition`（宣告当前处于理性认识形成阶段，下一步进入实践验证＝S3）· `grill-me`（S5 拷问协议已就位：一次一问、附建议答案、走完决策树）。

**下一步（等用户）**：挑一个**已经做出**的真实决策，写 1–2 页 ADR（≥2 备选且各有代价、可度量后果、推翻条件）→ 我用 `grill-me` 逐条拷问 → 修订 → 五条标准逐条判定并写入本页 frontmatter → 站点自动更新。
## [2026-10-05] fix | S0 目标由「手头材料」反推，把「快速进入领域」变成备考 → [[rapid-domain-entry-protocol]]

**事件**：用户在「学习模式」下先选定领域，随即明确纠正——「**我的学习不是为了考试**」「**只是为了真正的学会一个领域或者事物**」「**这个过程中你需要尽可能的启动 skills**」。
**根因**：我给的 S0 选项菜单里两个是考试（因为其 Note 库里躺着《系统架构设计师-12周深度学习计划》《证券从业资格证备考方案》），把**可得材料**当成了**目标来源**。这是方法缺陷，不是选择错误——S0 的第一性问题是「这个能力我拿去做什么」，不是「我手头有什么材料」。
**修复**：
1. 运行单重写为**能力向**：靶子=真实系统的架构决策（建议用其 Note 库 `10_Projects/DoggyArium` 论坛项目当案例），交付物=可评审架构设计 + 一次真实评审；考试信息降级为文末「若将来考证」附录。
2. [[rapid-domain-entry-protocol|RDEP]] 加固三处：①**S0 反模式**——目标由用途定、不由材料定；②**「真正学会」五条行为标准**（能提问 / 能判断 / 能迁移 / 能教 / 知边界；任一不达标只能诚实称「熟悉」）；③**每阶段技能路由表**——开工前必须用 `skill` 工具**真的加载**对应技能。
3. 运行单 `rdep_stages` 每阶段加 `skills` 字段；站点看板新增「先加载 skills：…」渲染（7 行）。技能路由不是文档条目，是**开工前置动作**。
**技能实际启动记录**：本会话已加载并落地 `contradiction-analysis`（结构化矛盾分析：主要矛盾=「熟悉感 vs 可迁移的能力」，非对抗性；对策=行为标准 + 阶段闸门 + 真实靶子；监控项=「把学习变成建系统」与「怕被看见」）与 `practice-cognition`（宣告当前处于**理性认识形成阶段**，下一轮进入实践验证 = S3）。其余按路由表待各阶段加载。
**台账**：[[promotions|Promotion Ledger]] Knowledge Notes 登记本协议的三个方法要点。
## [2026-10-05] ingest | 快速进入领域协议（RDEP）+ 填空表：三档预算 × 七阶段 × 五闸门 → [[rapid-domain-entry-protocol]]

**动因**：用户宣布进入「学习模式」，要求一份「能快速进入任何一个领域」的学习方案，并指定本库代理为师友（最佳师友）。

**产出**：
1. `learning/rapid-domain-entry-protocol.md`（Pattern）：**三档预算**（T0 速通 3h / T1 上手 9.5h·7天 / T2 深入 29.5h·4周）× **七阶段**（S0 契约 → S1 五格地图 → S2 30–50 术语 → S3 复现一个经典结果 → S4 定位 2–3 个真实分歧 → S5 产出 300–600 字给具名读者 → S6 第 3/10/30 天检索复习）。每阶段都有**产出物 + 通过闸门**；另含「预算被压缩时的取舍优先级」「师友分工表」「自适应止损规则」「六条反模式」。
2. `templates/rapid-domain-entry-worksheet.md`（Template）：可复印填空表，一格一闸门，末尾附失败信号自查。
3. 接线：[[learning|学习中枢]] 场景选篇首行 + 知识本体 14→15 篇；`index.md` 学习集群置顶；Hugo 站点自动多出该页（首页卡片 15）。

**数字核验（§2.6，脚本计算）**：0.5+2+1.5+2.5+1+1.5+0.5 = **9.5 h**；÷7 天 = **1.36 h/天**；T0 = 3 h；T2 = 29.5 h；复现+产出 = 4 h = T1 预算的 **42.1%**（设计目标，非实测最优）。

**验证**：Hugo 严格构建 exit 0 / 0 警告（内容文件 15）；全站产物 **0 处**未解析 `[[`；新页内链 48 条、含 OKF 面板与三档表；预览服务 watcher 已自动重建并 HTTP 200；图库断链复查——新增内容引入 **0** 断链（81 处历史命中全为模板/示例占位）。

## [2026-10-05] refactor | 用 hugo-static-site 技能落地学习站（站点根=库根，严格构建 0 警告）→ [[learning]]

**技能流程**（按 `hugo-static-site` 的「动任何东西之前」三步）：①`hugo version` = **v0.167.0+extended**（与你 hugozh.cn 站同版本，故 `locale` 而非 `languageCode`）；②查 watcher：本机两个 `hugo server`（1515 = Hugo 中文文档站、1313 = 其它项目）**都不盯本库**，无 G13 冲突；③基线：库内无任何 hugo 配置，基线构建为空站（仅 2 条「无布局」WARN）。

**落地**（站点根 = 知识库根，内容源 = `learning/`，共 14 篇）：
- `hugo.toml`：`contentDir = "learning"`、`locale = "zh-cn"`、`enableGitInfo`、`hasCJKLanguage`、`enableRobotsTXT`、`timeZone`；`[frontmatter] date/lastmod = [..., ":git"]`。**所有键名取自 `hugo config --printZero` 实测**，不凭记忆。
- `layouts/`：`index.html`（学习中枢仪表盘：三句话立场 + 场景选篇 9 行 + 14 篇卡片 + 技能路由 + 三张清单 + 来源与诚实边界）、`_default/{baseof,single,list}.html`、`404.html`、`partials/{head,header,footer,okf-meta,wiki-body,skills}.html`、`robots.txt`（含 Sitemap 行、非 production 自动 Disallow）。
- `static/`：`css/style.css`（零依赖、明暗双主题、CJK 字体栈）、`favicon.svg`。
- `.gitignore` 增 `public/`、`resources/`、`.hugo_build.lock`（技能 versioning 节：只跟踪源）；`index.md` 增「🌐 站点」节。

**两项设计**：①**同一份事实**——站点直接读笔记 frontmatter，把 OKF v0.2 的 `generated.at` / `sources` / `status` / `confidence` / 信任层级渲染成「OKF 面板」（`status` → 生命周期映射 budding→draft、evergreen→stable 也已呈现）；裸 wiki 链接渲染为**目标页标题**、别名链接渲染为别名、表格内 `\|` 转义写法同样解析、站外目标退化为纯文本不留死链。②**技能实时生成**——首页 27 个技能由构建时读取各 `SKILL.md` frontmatter 得到，无手工快照（`fileExists` + `readFile` + `transform.Unmarshal`）。

**验证（技能交付清单逐项）**：严格构建 `--ignoreCache --cleanDestinationDir --panicOnWarning --printPathWarnings --printUnusedTemplates --printI18nWarnings` → **exit 0、0 警告**；页面数 71 逐项对账（14 笔记 + 首页 + 404 + 1 分类总览 + 25 术语页 + 26 RSS + 2 静态 + robots/sitemap = 73 文件）；全站产物 **0 处未解析 `[[`**；审计构建（`HUGO_MINIFY_TDEWOLFF_HTML_KEEPCOMMENTS` + `HUGO_ENABLEMISSINGTRANSLATIONPLACEHOLDERS`）后 grep `public/`：`HAHAHUGOSHORTCODE` / `ZgotmplZ` / `[i18n]` / `{{` 全为 0；脚注正常（metacognition 篇）；404 套用 baseof；dev 环境自动 `noindex`、production 不输出。
**预览**：`http://localhost:1414/growth/`（`hugo server --noBuildLock --renderToMemory`，端口避开已占用的 1313/1515）。

**过程中实证的 3 个坑（可复用）**：
1. **Go 模板注释里的 `*/`**：注释中写路径 `.agents/skills/*/SKILL.md` 会提前终止注释 → 构建报 `parse of template failed: comment ends before closing delimiter`。路径通配不要写进注释。
2. **`--printUnusedTemplates` 对 taxonomy 模板误报**：v0.167 把 `_default/terms.html` 判为 unused，但 `--templateMetrics` 显示它执行 1 次、且 `/tags/` 产物含其特征内容 → 实证为**误报**；处置：术语云并入 `list.html` 并删除该模板，严格构建回到 0 警告。
3. **`[frontmatter]` 不支持嵌套路径**：`date = ["generated.at", ...]` 不被解析，`hugo list all` 静默回退到 `:git`（观测值 = 提交时间）→ 改回 `["date", ":git"]` 并把结论写进配置注释；OKF 的 `generated.at` 只在模板层直接读取展示。

## [2026-10-05] fix | 表格内 wiki 别名管道符未转义（建站时被产物抽检照出）→ §4

**发现链**：用 `hugo-static-site` 技能在库根建站 → 交付前的产物抽检发现 `public/review-and-recall-rhythm/index.html` 残留半截链接 `([[mental-mo…`。
**根因**：该笔记第 41 行的**表格单元**里写了 `[[mental-models-lattice|Mental Models Lattice]]`——Markdown 把未转义的 `|` 当单元格分隔符，链接与表格同时被切断。**Obsidian 与 Hugo 行为一致**，所以这是笔记本身的缺陷，不是站点问题；反过来说，**站点构建可以当图库体检的探针**（人类阅读时这种破损很容易被忽略）。
**修复**：`learning/review-and-recall-rhythm.md:41` 改为 `[[mental-models-lattice\|Mental Models Lattice]]`；全库复扫（逐行判定「表格行 + 未转义别名管道」）确认**仅此 1 处**，其余 10 篇的别名链接都不在表格里。
**升格（§2.5：复发 → 载体必须加强）**：2026-08-14 已有同类经验（[[knowledge-graph-patterns|Knowledge Graph Patterns]]「显示语法必须转义」），本次复发证明「知识笔记」作载体约束力不足 → **提升为 AGENTS.md §4 硬规则**（在 349/350 行预算内 +1 行，未超预算），并登记 [[promotions|Promotion Ledger]]。
**方法论收获**：站点构建是**跨介质验证**——同一份 Markdown 在 Obsidian、GitHub、Hugo 三种解析器下都要成立；只在一种介质里看，会漏掉结构性缺陷。

## [2026-10-05] session | 建库：OKF v0.2 + 学习集群 14 篇 + 27 技能 + 定名知行 → §7

**本次会话全貌**：
- **入**：从本机 Note 库**只读**抽取「成长与学习」资产（3 名只读子代理并行侦察：学习类文档 13 + 元认知/知识管理 18 + 技能 36 个），Note 库全程零写入。
- **出**：`/learning/` 集群 **14 篇**原子笔记 + 根 hub [[learning|学习中枢]]；**23 个技能**导入 + hugozh.cn 的 `hugo-static-site`（13 文件 / SHA-256 **13/13** 通过）；[[imported-skills|技能导入台账]]；OKF v0.1 → **v0.2** schema 迁移（AGENTS.md v1.9.0）。
- **校验**：真实断链 0 · 孤儿 0 · 版本同步 ✓ · 升格审计 0 欠债 · §2.6 全量数字脚本重算 · 提交前敏感信息扫描（266 个跟踪文件，2 处误报已人工确认属实为代码示例）· `.env` 与 `user-config.md` 均未进库。
- **身份**：owner = **亦幸**，AI 管家 = **知行**（`_identity/user-config.md`，gitignored；`Nova` 保留为结构性标识），初始化闭环 `pending_personalization: false`。
- **发布**：`4c3ec71..96fc3aa` 已推送 `origin/main`（github.com/hencter/growth），本地与远端哈希一致。
- **下一轮待办**：① 用户给出第一个真实学习题目 → 跑通学习回路并产出笔记；② 可选：把 Note 库那份旧 `hugo-static-site` 副本（12 文件 / 3 处哈希不符 / 缺 INSTALL-PROMPT.txt）对齐成新版（需用户授权写 Note 库）；③ 可选：27 个技能约 2,600 token 的会话固定开销是否收窄。

## [2026-10-05] init | 自主定名：知行（AI 管家）· owner 亦幸 → [[learning-acceleration-loop]]

用户委托自行取名（原话「你自己起名字吧」），`_identity/user-config.md`：`nova_name` = **知行**，`owner_name` = **亦幸**，`pending_personalization: false` —— 本库初始化完成。

**取名理由**：本库立库主张是「回路闭环 + 输出即检验」（[[learning-acceleration-loop]]、[[output-based-retention]]、`practice-cognition` 实践论），「知」「行」二字正对「认知必须回到实践验证」；同时承接 Note 库代理「幸知」的「知」字——两库人格同源、各自独立。

**约定**：文件名与既有 wiki 链接（`_identity/nova-identity.md`、`[[nova-identity|Nova Identity]]` 等）**不改名**——它们是 schema 契约与图谱节点，改名即断边。显示名以 `user-config.md` 的 `nova_name` 为准（AGENTS.md §0 已规定覆盖行为）：**角色槽位叫 Nova，我的名字叫知行**。`nova-identity.md` 顶部加显示名说明。

## [2026-10-05] init | 主人定名：亦幸 → [[learning]]

`_identity/user-config.md`：`owner_name` = **亦幸**（用户直接给出），`initialized: true`，`domain: learning-and-growth` 保持不变。
`nova_name` 仍为临时值 `Nova`，`pending_personalization: true` —— 待用户给出 AI 管家名字后覆盖并置 `false`。
本文件被 `.gitignore` 忽略（属个人配置，不进版本库）。

## [2026-10-05] lint+fix | 图谱体检（90 文件）+ §2.6 数字复核：真实断链 0 · 孤儿 0 · 版本同步 ✓ → §2.6

**Lint（图谱 90 个 .md，排除 skills/.git/.obsidian/log-archive）**：
- **断链**：原始命中 95 处 → 分类后：转义管道伪影 22（表格内 `[[x\|别名]]`，库内既有做法，`_meta/self-bootstrapping.md:100` 已在用）、示例/模板/历史占位 76（AGENTS.md、`templates/`、`conventions.md`、`obsidian-syntax-reference.md`、`conference/`、`log.md` 历史条目、`okf-format.md` 代码示例）、**真实断链 2**（`learning/memory-palace-dual-coding.md` 内两处示例 wikilink）→ 已改为无方括号占位（`<wikilink to the palace note>`），真实断链归零。
- **孤儿**：知识节点 **0**；命中 2 个 `_agents/*.md` 属机器配置（AGENTS.md §2 明确 skills/agents/config 非图节点），豁免。
- **版本同步 ✓**：AGENTS.md v1.9.0 = index 统计块 v1.9.0；`okf_version: "0.2"` = 框架 v0.2 = 页脚 `Conforms to: OKF v0.2`。
- **升格审计**：`fix` 条目 5 条，缺 `→` 引用 0 条（无未结债务）。
- **frontmatter 合规**：缺 `type` 的 7 个文件全属豁免类（`_agents/` 子代理配置 2、`_identity/` 配置与拒绝话术 2、`conference/` trace 3）；「双 YAML 块」告警 13 处经逐条复核为正文 YAML 示例（`markdown-frontmatter.md`、`templates/` 等）**假阳性**。
- **绝对路径（§1 硬规则）**：修复 5 处——本轮新引入 3 处（`learning.md`、`_meta/imported-skills.md`、本轮 log 条目）与历史遗留 2 处（`_meta/development.md` 的 worktree 路径、`RELEASE.md` 的合并注释）。`log.md` 历史条目按 append-only 不重写；`_agents/terminology-auditor.md:15` 的 `C:\...` 是「如何识别绝对路径」的教学示例，保留。

**§2.6 数字复核（全部脚本重算，未凭记忆）**：学习笔记 14 篇 · 技能 27 个 / 160 文件 / 793.0 KB（812,067 B）· 导入 23 个 / 144 文件 / 688.4 KB · hugo 包 13 文件 / 93,953 B · 时间块 3h×5 + 8h×1.5 = **27h/周** · 210 + 100 = **310h** · **27×13 = 351 ≠ 310**（源方案内部不自洽，已在笔记内标注）· `1.01^365 = 37.78` · AGENTS.md **349/350** 行。

**教训（normal）**：初稿沿用了「过程中的旧测量值」——技能总体积写成 788.4 KB（实为 793.0 KB）、导入文件数写成 101（实为 144），差异来自移植补丁与统计口径，直到收尾复核才暴露。根因：§2.6 已要求数据输出必须计算器核验，但我的核验时点在**写入笔记之后**，而计数/体积类数字会随写操作继续变化。**做法固化**：计数与体积类数字在**最终交付前统一重算**，不沿用过程值（不新增规则，§2.6 已覆盖，属执行时点问题）。→ §2.6

## [2026-10-05] refactor | 采纳 OKF v0.2（provenance/trust/lifecycle）+ 全库声明同步 → §3

**动因**：用户问「dev 分支有 OKF 2.0 没同步到当前么」。实测结论：模板库 `hencter/Nova` 的 `dev`（5bd1216，08-26）**落后于** `main`（c10b292，10-05）——逐文件比对：仅 dev 有的文件 0 个，仅 main 多的只有 `LICENSE`；两分支 `AGENTS.md` 均为 v1.8.0 / `Conforms to: OKF v0.1`。本库 origin 是 `hencter/growth`（单一 `Initial commit`），从未引入 dev。**真正变化在上游规范**：Google 的 OKF 已发布 **v0.2**（provenance / trust / lifecycle / attestation 一等公民），版本号是 0.2 不是 2.0。

**变更**：
1. `AGENTS.md` v1.8.0 → **v1.9.0**：§3 改为「OKF v0.2 + Nova Extensions」，补三族字段说明、actor 约定（`<producer>/<version>` / `human:<id>` / `process:<id>`）、信任三层级、`status` 映射与 Nova 扩展/偏离清单；§4 引用口径改为 frontmatter `sources`；页脚 `Conforms to: OKF v0.2`。行数维持 **349/350**（一进一出压缩）。
2. `index.md`：`okf_version: "0.1"` → `"0.2"`，统计数据同步 v1.9.0，新增学习集群与导入台账入口。
3. `concepts/okf-format.md`：按上游 `SPEC.md` 重写为 v0.2（§4.1/§5/§6/§7/§8/§9/§11/§13 逐条对齐；含两处 breaking change 与其 fallback），`sources` 改 v0.2 条目（`id` + `resource`），正文引用改脚注。
4. 全库声明同步 6 处：`_meta/conventions.md`（2 处）、`_meta/vault-architecture.md`、`concepts/markdown-frontmatter.md`、`patterns/knowledge-graph-patterns.md`（顺带修死链 `github.com/google/okf`）、`README.md`；`templates/concept-template.md` 模板与字段表升级。
5. `_meta/promotions.md` 登记 Active Rules（2026-10-05 行）。
6. **冲突处理**：OKF `status`（draft/stable/deprecated）与 Nova 成熟度枚举撞名 → 建立映射（seedling/budding→draft · evergreen→stable · superseded/archived→deprecated），保留 Nova 枚举为生产者扩展；`timestamp` → `generated.at`，旧笔记保留 `timestamp` 走 v0.2 fallback，**编辑时迁移，不追溯伪造 `generated.by`**。
7. 实测：5 个引用 URL 全部 200（SPEC.md / v0.2 博客 / v0.1 博客 / Karpathy gist）；`AGENTS.md` 行数 349。

## [2026-10-05] ingest | 学习集群落地：14 篇原子笔记 + 学习中枢 + 27 技能路由 → [[learning]]

**背景**：用户要求从本机 Note 库（另一个知识库，**只读**；绝对位置见会话记录，按 §1 不写入库内文件）抽取「成长与学习」的 SKILL 与知识点，在本库建成「更快的学习」方法论体系。

**产出**：
1. **新集群** `/learning/` + 根 hub [[learning|学习中枢]]（`type: Index`）：三句话立场 + 场景选篇表 + 27 技能路由表 + 学习前/中/后三张清单 + 来源诚实边界 + 数据口径。
2. **14 篇原子笔记**（全部 v0.2 frontmatter）：[[learning-acceleration-loop]]（七阶段回路）、[[naval-learning-method]]、[[first-principles-thinking]]、[[investigation-before-judgement]]、[[metacognition-monitoring-protocol]]、[[output-based-retention]]、[[review-and-recall-rhythm]]、[[learning-time-block-design]]、[[mental-models-lattice]]、[[progressive-disclosure]]、[[memory-palace-dual-coding]]、[[sandwich-teaching-method]]、[[source-credibility-and-observation-stance]]、[[independent-thinking-against-information-overload]]。
3. **技能**：从 Note 库导入 23 个（毛式方法论 10 + 学习与知识管理 3 + 认知复盘 7 + 自举 3），跳过 4 类强绑定项（理由见台账）；登记 [[imported-skills|技能导入台账]]。
4. **诚实标注**（不采信、已写入笔记）：源库 3 处标题与内容错配（《学习方法总结》实为显示器静电排障、《学习计划制定》实为 IT 命名规则、《技能提升路径》实为 Windows 临时文件排查）、6 处断链、4 处文件截断；未证实数字（学习金字塔百分比、「7 年达顶尖」、网速百万倍、SpaceX/特斯拉成本比例）逐条标为未独立核实。

## [2026-10-05] init+fix | 库初始化 · hugo-static-site 技能包 13/13 校验通过 · 技能副本修补 → [[imported-skills]]

1. `_identity/user-config.md` 落临时默认（`nova_name: Nova` / `owner_name: 朋友` / `domain: learning-and-growth` / `pending_personalization: true`）——用户选择自行定名并要求先开工，待其给出后覆盖本文件并置 false。
2. **hugo-static-site**（hugozh.cn 技能包）装到 `.agents/skills/hugo-static-site/`：13 个文件 / 93,953 B / **逐文件 SHA-256 与清单 13/13 一致**（按清单 `files[].url` 取发布字节，避免 git clone 的 CRLF 转换）；目录名与内部相对路径严格照清单，未拍平未改名。装后本会话技能目录**实时刷新**，`hugo-static-site` 已可加载，无需重启。
3. 技能副本修补（原件未改）：8 个源 `SKILL.md` 的句中物理截断在副本上补完并加 `<!-- import fix -->` 标记；`skill-fixer` 的 `.opencode/skills/` 硬编码改为 `.agents/skills/`（3 处，含 2 个 `.sh`）；`self-evolution` / `thinker-distiller` / `skill-creator` 追加「Portability note」写明本库对应路径。
4. `.agents/skills/` 现 **27 技能 / 160 文件 / 793.0 KB**（实测 812,067 B）；会话固定开销约 7,066 字符描述 ≈ 2,600 token（粗估，收窄方法已记入台账）。
5. 采集方式：3 名只读子代理并行侦察（Note 库学习类文档 13 + 元认知/知识管理 18 + 技能 36 个），主会话只写本库——Note 库全程零写入。

## [2026-08-26] fix | skills 兼容入口改为符号链接 → .agents/skills → §8

**原因**：用户将技能内容移回 `skills/`（真实目录），要求保留旧路径入口。采用方案：技能真实位置固定在 `.agents/skills/`（DSH 自动发现），根目录 `skills` 创建为指向它的符号链接（相对目标，可移植）。

**变更**：
1. `skills/*` → `.agents/skills/`（技能真实位置不变，单份存储）；根目录 `skills` 改为 SymbolicLink → `.agents/skills`（Windows 开发者模式未开启，经 UAC 提权创建）
2. `.gitattributes` 追加 `skills symlink`：Windows `core.symlinks=false` 下也按符号链接（模式 120000）跟踪，克隆/checkout 时重建链接
3. 实测：链接可访问 `skills/nova-kb/SKILL.md`；DSH `skill` 工具目录正常（扫描根为 `.agents/skills`）；提交 64678a1

**注意**：`core.symlinks=false` 的机器 checkout 时 git 会把该条目写为普通文本文件（内容为链接目标），链接语义只在支持 symlink 的环境恢复——`.gitattributes` 已保证仓库内始终按 120000 存储。

## [2026-08-26] refactor | vault 技能注册进 DSH 技能目录 — skills/ → .agents/skills/（AGENTS.md v1.8.0）→ §8

**动因**：用户指出 vault 仍未真正兼容 DeepSeek Harness——`skill` 工具加载不到任何 vault 技能（报 "unknown or no longer available"），AGENTS.md §8 只写了「技能=文件、直接读」的变通说明。DSH 的 filesystem 技能提供方只扫描 `<项目根>/.dsh/skills`、`<项目根>/.agents/skills`、`~/.dsh/skills`、`~/.agents/skills` 与 preset 的 `customSkillDirs`——vault 的 `skills/` 目录不在任何扫描根内。

**变更**（用户选定方案：vault 内建 `.agents/skills/`，DSH 自动发现，保持零配置可移植）：
1. `git mv`：`skills/nova-kb`、`skills/obsidian`、`skills/auto-commit` → `.agents/skills/`（Agent Skills 标准项目路径，DSH 按项目根自动扫描，亦兼容 Crush/Claude Code/Cursor）
2. `AGENTS.md` v1.7.0 → v1.8.0：§7 会话结束改 `skill` 工具加载 auto-commit；§8 Locations/Runtime loading 改为自动注册 + 按名加载（文件读取降级为 fallback）；§11 速查同步
3. 同步：README、`_identity/` 三件（capability-manifest/nova-identity/personalize）、`_meta/vault-architecture.md` 目录树、`tools/deepseek-harness.md` 技能目录表述、`_agents/terminology-auditor.md` 扫描路径、`log-archive/README.md`、`RELEASE.md`、三个 SKILL.md 的 DSH 运行时说明、`concepts/`（agent-skills-standard 采纳记录、skill-subagent-boundary、selective-persistent-memory）、`tools/crush.md`
4. 台账登记（Active Rules 2026-08-26 §8）；index.md 统计块版本同步 v1.8.0
5. 实测：目录变更后本会话 `skill` 工具实时刷新，`skill nova-kb` 加载成功 → §8

**保留**：log.md / conference 历史记录中的 `skills/` 路径为历史事实，不重写（append-only）。

## [2026-08-14] ingest+fix | 迭代第二轮 — Crush 笔记落地 + 运行时工具栈充实 + 2 条语义边补链 → [[crush]]

**Ingest**（上轮记录的候选缺口闭环）：
1. 新建 `tools/crush.md`（budding）：Crush = Charm 官方 OpenCode 继任者——Go/Bubble Tea TUI、BYOK 定位、`crush.json` 配置、`CRUSH.md` 全局上下文、多运行时技能路径（`.agents/`/`.claude/`/`.cursor/`）。来源：charmbracelet/crush、aicoolies 评测、BigGo 新闻、gumi.ink，并引 [[opencode]] §15 内部对照
2. 边接线：`tools/opencode.md` related 恢复 `[[crush|Crush]]` 断边（节点已实体化）；`tools.md` 与 `index.md` hub 登记——Crush 入链 3 条，无孤儿

**充实**：`tools/deepseek-harness.md` 补本会话实测的三类工具缺口——`weixin_bot` 微信桥（status/login/send/interject/sendFile）、`cordis_inspect_*` 只读能力发现（list/query/self）、`list_agents`/`send_message`/`interrupt_agent` 子代理持久生命周期；动态插件节补「inspect 只做发现、不替代业务 API」限定

**Lint（深度）**：
- 同社区标签共享交叉链接扫描：29 对标签重合 ≥2 无互链 → 判定 2 对为语义真缺口并补链（`agent-skills-standard` ↔ `a2a-protocol` 互操作标准；`reference-based-self-bootstrapping` → `karpathy-llm-curriculum` 自举复利）；其余为泛化标签巧合（如 tool-analysis/agent-platform），按 §2.3.3 语义诚实原则不机械补链
- 矛盾/陈旧：`RELEASE.md` 合并操作仍写 `git checkout main/dev`，与 worktree 模式（2026-08-14，分支锁定各自 worktree）直接矛盾 → 重写为 worktree 双目录发布流程 | lesson: trivial（refactor 同步遗漏的一处）
- 版本同步 ✓（index v1.7.0 = AGENTS v1.7.0）；seedling 积压（~9 篇）如实保留，不做未深化的状态升级

**意义**：知识缺口按「上轮发现 → 本轮闭环」节奏复利；运行时笔记与实测能力对齐；图谱补链坚持语义优先，不污染边。

## [2026-08-14] session | 自主迭代循环 — lint 健康检查 + 全量修复

- 目标：vault 图健康稳态。64 个图谱文件扫描 → 3 真断链、1 孤儿、2 hub 缺口、3 条升格审计标题缺口 → 全部修复（详见下条 lint+fix）
- 升格 1 条（normal，知识笔记）→ [[knowledge-graph-patterns]]，台账已登记；git auto-commit 完成

## [2026-08-14] lint+fix | 自主迭代 — 图谱审计：3 处真断链 + 孤儿/hub 缺口 + 升格审计标题补全 → [[knowledge-graph-patterns]]

**Lint 发现**（64 个图谱文件全量扫描）：
- 真断链 3：`tools/opencode.md` related 中 `[[crush|Crush]]` 指向不存在节点；`concepts/harness-engineering.md` `[[log.md]]` 边指向非节点 trace；`concepts/obsidian-syntax-reference.md` L466 `[[Obsidian Maple Theme]]` slug 错误（正确为 `obsidian-maple-theme`）
- 孤儿 1：`_identity/lockdown-response.md` 零入链且未列 hub（conference session 文件为 trace，豁免孤儿规则）
- hub 缺口 2：`conference.md` 缺 08-05 审计会议行；根 hub `index.md` 零入链
- 升格审计：3 条 fix 标题缺 `→` 引用（均已登记台账，但标题未闭环）
- 版本同步 ✓（index v1.7.0 = AGENTS v1.7.0）；无 superseded/archived 陈旧笔记；其余"断链"均为代码块/反引号内的语法示例（误报）

**修复**：
1. `opencode.md` 移除 Crush 断边（外部项目，sources 已列；Crush 独立笔记列为候选缺口）
2. `harness-engineering.md` `[[log.md]]` → 文件链接 `[log.md](/log.md)`
3. `obsidian-syntax-reference.md` L466 slug 修正
4. `_identity.md` 登记 lockdown-response（入链 + hub 可达）
5. `conference.md` 补 08-05 会议行；`_meta/self-bootstrapping.md` 导航支柱改为 wiki 边 → `index.md` 获得入链
6. `log.md` 3 条 fix 标题补 `→ §9` / `→ §1` / `→ [[conventions]]`
7. 升格（normal）：教训「文档中展示的链接语法必须转义，lint 只计渲染边」写入 `patterns/knowledge-graph-patterns.md` Lint Checks 表 + 台账登记

**意义**：图谱零真断链；每个图节点 ≥1 入链；升格审计机械检查可干净通过。

## [2026-08-14] fix | P1 债务清理 — 归档目录落地 + promotions 台账回归预算 → §2.3

**原因**：08-14 会话挂账的 P1：promotions 台账 64 行超 50 行预算、`/log-archive/` 目录尚不存在（`.opencode/node_modules` 已在去 opencode 化 refactor 中清除）。

**变更**：
1. 新建 `/log-archive/README.md`：归档机制落点（陈旧 log 条目、台账退休历史、superseded 副本）、命名约定（`<source>-<date>.md`）、非图节点声明
2. `_meta/promotions.md` 压缩 64 → 43 行（≤50 预算）：frontmatter 流式压缩（tags/related/summary）、空表节合并为一行注释、Retired 节指向 `/log-archive/`
3. `RELEASE.md` 修正过时表述：头部「仅存在于 dev」改为「维护于 dev，发布时随合并进入 main」；删除不存在的 §14 引用

**意义**：台账重新满足自身行预算；log-archive 成为 lint §2.3 归档机制的实际落点；发布清单与实际分支结构对齐。

## [2026-08-14] refactor | 彻底去 opencode 化 — 兼容层移除，vault 成为 DSH 专属

**动因**：用户不再使用 opencode，仓库中的 opencode 内容仅为旧版知识库的兼容层。采用方案：配置/兼容层全清，知识笔记保留原样。

**变更**：
1. 删除 `opencode.json` 与 `.opencode/` 目录（含 agents/、node_modules 本地残留）
2. `.opencode/agents/` 两个子代理定义迁移至 `_agents/`（nova-architect、terminology-auditor）：frontmatter 摘除 opencode 专属字段（mode/temperature/permission），工具引用同步为 DSH 原生名，§12→§9 引用修正
3. `AGENTS.md` 摘除全部 opencode 兼容表述（§8 Locations/只读边界、§9 强制层与可移植映射、§10 支柱、§11 速查）→ 版本 1.6.0 → 1.7.0
4. 同步 `README.md`（运行环境/启动流程/技术栈）、`RELEASE.md`（合并清单）、`_meta/vault-architecture.md`（目录树）、`_meta/conventions.md`（换中性示例）
5. 同步 `_identity/` 三件（capability-manifest、nova-identity、personalize）
6. 知识笔记现状表述同步：`tools/deepseek-harness.md`（Vault Impact）、`concepts/reference-based-self-bootstrapping.md`（运行时说明 + 配置示例改历史表述）、`concepts/selective-persistent-memory.md`（图谱映射）
7. `index.md` 统计块版本同步 v1.7.0

**保留**（知识资产，非兼容层）：`tools/opencode.md`、`concepts/opencode-architecture.md` 等 opencode 知识笔记及其交叉链接；`log.md` 与 `conference/` 历史记录。

**意义**：vault 成为 DSH 专属仓库，零运行时专属配置文件（打开工作区即用）；`_agents/` 延续可移植 prompt 模式；AGENTS.md 行预算释放出空间。

## [2026-08-14] session | 启用 git worktree 模式 — dev 迭代 / main 生产测试

- 新建 dev worktree：`D:\OpenCode\Navo-dev`（锁定 dev 分支，全仓迭代）；主目录 `D:\OpenCode\Navo` 锁定 main（生产测试）
- 复制 `_identity/user-config.md`（gitignored）至 dev worktree，避免误触发初始化问答
- 分支分工与 worktree 规范写入 `_meta/development.md`
- 注意：`log.md` 将随分支分叉，合并时可能需手工解决冲突

## [2026-08-14] refactor | AGENTS.md v1.6.0 — 适配 DeepSeek Harness 运行时

**动因**：用户要求迭代优化，使 vault 适配当前运行环境 DeepSeek Harness。原 schema 层的工具名（Read/Write/Edit/Grep/Glob/Bash）与 DSH 工具栈（read/write/edit/grep/glob/pwsh）不匹配，运行时行为不一致。

**变更**：
1. `AGENTS.md` §9 重写为 DSH 原生工具优先级表 + 可移植映射（opencode↔DSH 一行对照）→ §9；§2.6 计算器 `Bash` → `pwsh`；§7 会话结束 auto-commit 改为直接读取技能文件；§8 新增 DSH 运行时加载说明（vault 技能=读文件、子代理=传 prompt、harness 组合在仓库外）；§10 External References 支柱改为 `web_search`；§11 同步；版本 1.5.1 → 1.6.0（行数保持 ≤350）
2. `skills/nova-kb` / `obsidian` / `auto-commit` 三个 SKILL.md 工具名同步为 DSH 原生名并加运行时说明；修正 nova-kb 一处缩进与 prerequisites 示例（→ §3，lesson: trivial）
3. 新建 `tools/deepseek-harness.md`（budding）：DSH 运行时模型、工具栈、安全模型、与 OpenCode 对照——已注册 tools.md / index.md，入链 harness-engineering
4. `_identity/` 三文件同步：capability-manifest 工具清单改为 DSH 原生栈；personalize 第 3 步改为"确认运行环境"；nova-identity 技能/代理加载方式更新（§11→§8 编号修正，lesson: trivial）
5. `README.md` 运行环境改为 DeepSeek Harness（保留 opencode/Crush 兼容说明）；`index.md` 统计块版本同步
6. 知识笔记中的操作指引 3 处（cross-session-memory / okf-format / knowledge-graph-patterns）grep 工具名同步；reference-based-self-bootstrapping 补 DSH 运行时说明
7. `log.md` 头部工具说明同步；`_meta/promotions.md` 台账登记（§9 更新 + deepseek-harness 知识笔记）

**意义**：schema 层与当前运行时对齐——DSH 的沙箱/审批机制成为 §9 的强制层；vault 保持 Agent Skills Standard 可移植性（§9 映射表一行即可切换运行时）。

**跟进（P1）**：promotions 台账已超 50 行预算，需归档至 `/log-archive/`；`.opencode/node_modules`（gitignored 本地产物）可择机清理。

## [2026-08-05] fix | 新增 Data Accuracy 元能力 — 计算器验算硬规则 → §2.6

**原因**：用户指出 Nova 缺少数据准确性元能力。LLM 算术不可靠，任何涉及数据计算或数据获取后的验算都必须用计算器验证，不能凭心算输出。

**变更**：
1. `AGENTS.md` 新增 §2.6 **Data Accuracy — Calculator Required (Hard Rule)**：任何数据输出（计算/聚合/转换/统计/由数字推导的声明）必须在交付前用计算器验证；触发条件 = 数据计算请求或数据获取后需验算；协议 4 步（识别数字声明 → Bash+python/node 计算 → 验算取回的数值 → 引用验证值与计算过程，验证失败则明说）
2. `AGENTS.md` §0 Core Directives 新增第 6 条 **Be Accurate**（优先顺序第 6）
3. `AGENTS.md` §11 Quick Reference 新增 "Verify data output" 行
4. 修复 AGENTS.md 4 处粘连格式损坏（§2.1/§6/§9/§11 合并行丢失换行），并压缩至 350 行预算内（355 → 350，净变化 +§2.6）
5. `_meta/promotions.md` 台账 Active Rules 登记 §2.6

**意义**：数据准确性成为每次会话强制执行的元能力；计算器验算被编码为硬规则（§2.6），与 §9 工具边界兼容（python/node 属允许工具）。

## [2026-08-05] refactor | AGENTS.md v1.5.1 — 蜂群会议批判审计后修订

**动因**：v1.5.0 图语义迭代经蜂群子代理会议（nova-architect / terminology-auditor / critic）批判审计，裁定"定稿失败进入修订"。三席共识：核心洞见正确（log=trace，升格进每会话加载层才算 standard），但存在 P0 级缺陷——§2.5"概念笔记 by construction 防复发"是伪承诺、升格闭环零外部强制点、无容量预算、术语 4 处定义级冲突、执行层 SKILL.md 脱节。

**变更**：
1. `AGENTS.md` §2 重写：图语义诚实化（"Every knowledge note is a node"；graph edges = wiki links only；hub = 任何 `type: Index` 文件；community = 拥有 hub 的目录）；§2.5 增加**严重度闸门**（critical/normal/trivial）+ **fix 条目硬格式**（`→ [[artifact]]`/`→ §N`/`| lesson: trivial`）+ 默认载体改笔记+台账；§2.3 lint 改为 **Grep 机械审计**（不读全量，兼容选择性记忆）+ session-end 触发；§2.1 删机械互惠边，孤儿=零入边
2. boot 序列新增 step 5：读 `_meta/promotions.md`（操作约束进入加载集）
3. `AGENTS.md` §3 tags 改多行格式（修正 06-26 lint 迁移未同步的活体 false fix → §3）、prerequisites 改 wiki 链接优先；§1/§4/§6 路径与术语修正；§7 增加快速 lint + auto-commit 阻塞；版本 1.5.0 → 1.5.1
4. 新建 `_meta/promotions.md` 台账（Active Rules / Active Constraint Notes / Knowledge Notes / Retired，≤50 行）
5. `skills/nova-kb/SKILL.md` 同步：8 步 lint、孤儿零入边口径、Promotion workflow、日志格式补 `fix`
6. `_meta/conventions.md`：新增 Graph Semantics 小节、生命周期补 archived、prerequisites 改 wiki 链接
7. `_meta/vault-architecture.md`：修复 wiki 链接语法、目录树改根级 hub、hub 定义
8. `index.md`/`_meta.md`：版本同步 + 台账条目
9. 会议记录：`conference/session-20260805-graph-audit.md`

**意义**：闭环首次获得外部强制点（Grep 硬判据 + auto-commit 阻塞）；术语统一消除 lint 不可复现性；schema 行数预算（≤350 一进一出）防止 v1.4.0 膨胀复发。升格积压（06-30 相对路径、07-23 fix 引用）与 git pre-commit hook 为 P1 后续跟进。

## [2026-08-05] refactor | AGENTS.md v1.5.0 — Graph-Semantic Model + Promotion Protocol

**动因**：用户指出 Nova 知识库的根本缺陷——`log.md` 记录只是记录（trace），不是错误标准（standard）；错误发生后无法防止再犯。同时引入网络新兴的 Graph Engineering 视角（GraphRAG / Agent 记忆图谱）作为解决方案框架。

**变更**：
1. `AGENTS.md` §2 整体重写为 **Graph-Semantic Model**：vault 显式定义为知识图（节点=文件、边=wiki 链接、hub=index.md、社区=目录）；`log.md` 降级为 trace layer，图才是 standard layer
2. **新增 §2.5 Promotion（核心指令）**：错误/修复必须「记录 → 根因分析 → 升格为 schema 规则/概念笔记 → 接线（related/索引）→ 关联 trace」；未升格的 fix 是 false fix，lint §2.3 step 7 会审计
3. §2.2 Query 引入 **local/global 双模式**（GraphRAG 社区摘要思想，引用 arXiv:2404.16130）：local 沿边导航、global 从 hub 遍历社区综合
4. §2.3 Lint 新增 **社区缺口分析**（同域笔记未交叉链接=缺失边）与 **升格审计**
5. §7 session-end 增加「升格本会话教训」步骤；§10/§11 同步；版本 1.4.0 → 1.5.0
6. `index.md` 统计块版本同步

**意义**：把「图」从描述性隐喻升级为 schema 层的强制运行逻辑——记录只有通过升格为「节点+边」才能成为标准。回答了用户核心疑问：防再犯不靠 log 记录，靠把错误升格进每次会话都会加载的 schema 层。

## [2026-07-27] refactor | AGENTS.md v1.4.0 普通用户可用性重构 + obsidian 技能

**动因**：从「普通用户可用性」角度审查 AGENTS.md（580 行），发现 lockdown 无逃生口、git 硬依赖、研究内容与运行规则混杂、frontmatter 缩进错误等问题。

**变更**：
1. `AGENTS.md` 580 → ~250 行：新增中文人类导读（顶部）；init lockdown 增加逃生口（说「跳过」即写入默认值继续）；lockdown 话术从 base64 改明文 `_identity/lockdown-response.md`（含缺失回退）；Trigger B 改用显式 `initialized: false` 标志替代字符串哨兵；git 降级为可选增强（懒检测、不自动安装、静默降级）；§14 分支策略下沉至 `_meta/development.md`；删除 harness/GEP 研究性段落（保留规则，内容已在 concepts/ 笔记中）；修复 §2.3 双编号与 §10 缩进错误。版本 1.3.1 → 1.4.0
2. 新建 `skills/obsidian/SKILL.md`：封装 Obsidian 官方 CLI（orphans/unresolved/deadends/backlinks 等 lint 原语），CLI 不可用时静默回退原生工具；硬性禁止 plugin/theme/eval 操作
3. `_identity/user-config.md` + `.user-config-default`：新增 `initialized` 字段
4. `README.md`：Git 改为可选、新增「不想起名？说跳过」逃生口说明、新增用户指令对照表
5. 修复 `index.md`、`concepts.md` frontmatter 中 `timestamp` 错误缩进（被 YAML 解析为 tags 子项）
6. `_meta/development.md` 新建（分支策略）；`_meta.md`、`index.md` 索引同步

**意义**：schema 层从「开发者研究文档」回归「运行规则手册」；克隆用户不再被 lockdown 困死；无 git 环境完全可用；lint 获得 Obsidian 原生图缓存支持。

## [2026-07-23] init | Vault owner configured

初始化完成：使用者称呼为 `开发者`，Agent 名称为 `Nova`，主领域为 `ai-engineering`。

## [2026-07-23] fix | 禁止 agent 配置 model frontmatter → §9

**原因**：设置 `model` 会锁定 agent 到特定模型提供商，用户环境中可能无法连接（API key 缺失、地域限制、速率限制），导致硬失败。

**变更**：
1. `AGENTS.md` §9 — 新增核心原则：禁止 agent frontmatter 中设置 `model`，让 opencode 默认模型路由处理
2. `.opencode/agents/nova-architect.md` — 移除 `model: anthropic/claude-sonnet-4-20250514`
3. `.opencode/agents/terminology-auditor.md` — 移除 `model: anthropic/claude-haiku-4-20250514`
4. `AGENTS.md` 版本 1.3.0 → 1.3.1；`index.md` 统计同步

**意义**：agent 定义从「绑定模型」变为「模型无关」，提高跨环境可移植性。

## [2026-07-13] research-session | Nova 核心架构迭代 — 互联网/论文/GitHub 全面检索与执行

**检索范围**：arXiv (2026年7月最新论文)、GitHub Trending (AI Agent / Agent Framework)、agentskills.io、MCP/A2A 协议更新、Claude Code v2.1.207、Crush/OpenCode 分支状态

**关键发现**：
1. **OpenCode 已归档** (2025-09-18) → Crush (charmbracelet/crush, 26.5k stars) 接替 + SST/OpenCode 独立分支
2. **Agent Skills 开放标准** (agentskills.io) — 40+ 工具采纳，SKILL.md 跨平台可移植
3. **选择性持久记忆** (arXiv:2607.09493) — 选择性记忆 96% > 无记忆 79% > 全量历史 71%
4. **Harness Engineering** (arXiv:2607.08028) — "Prompts → Contracts"，代码级合约优于纯 prompt
5. **分层记忆架构** (arXiv:2607.07666) — 三层有界上下文，PI-Agent 监督
6. **自进化 Agent** (EvoMap/Evolver, 8.9k stars) — GEP 基因组协议，Genes > Skills 文档
7. Microsoft Agent Framework (12.1k) + Agent Governance Toolkit (OWASP Top 10)

**执行（6 并行子代理）**：
- `tools/opencode.md` — 更新为 budding，新增 Crush 接替者/SST 分支/Agent Skills 等 8 个新章节
- `concepts/agent-skills-standard.md` — 新建 (budding)
- `concepts/selective-persistent-memory.md` — 新建 (seedling)
- `concepts/harness-engineering.md` — 新建 (seedling)
- `concepts/hierarchical-memory-architecture.md` — 新建 (seedling)
- `concepts/self-evolving-agents.md` — 新建 (seedling)
- `concepts.md` — 更新条目，新增 5 个概念
- `index.md` — 更新条目，新增 5 个概念

## [2026-07-13] ingest | Created: Agent Skills Standard

基于 agentskills.io 最新规范（2026年7月），创建了 Agent Skills 开放标准的原子概念笔记。
- 渐进式三阶段加载模型（Discovery → Activation → Execution）
- SKILL.md frontmatter 规范（必需 + 扩展字段）
- 标准路径定义（`.agents/skills/` 为主，兼容 `.crush/skills/`、`.claude/skills/`、`.cursor/skills/`）
- 40+ 工具生态图谱（Claude Code, Cursor, GitHub Copilot, Crush, Gemini CLI, Goose 等）
- 与 Nova 现有 `agent-skills-system.md` 的关系与差异分析
- 与 MCP、A2A 标准的互补关系

## [2026-07-13] ingest | Created: Selective Persistent Memory

**来源**：arXiv:2607.09493 — Shared Selective Persistent Memory for Agentic LLM Systems
**产出**：`concepts/selective-persistent-memory.md`
**状态**：`seedling`

**核心发现**：选择性记忆 96% > 无记忆 79% > 全量历史 71%。全量历史持久化（包括 Nova 当前的 log.md）反而会降低 agent 性能。

**跨链接**：
- `concepts/cross-session-memory.md` — 新增 related 链接
- `concepts.md` — 新增条目

**Nova 相关性**：log.md 本质上是 naive full-history persistence，论文建议需要选择性遗忘/压缩层。workspace 概念对应 Nova 的 `conference/` 目录。

## [2026-07-13] ingest | Created: Harness Engineering (arXiv:2607.08028)

**来源**：arXiv 论文 "From Prompts to Contracts: Harness Engineering for Auditable Enterprise LLM Agents" (2026-07-09)

**新建**：
- `concepts/harness-engineering.md` — 将确定性 agent 行为从 prompt 迁移至代码、manifest、schema 与验证器 artifacts 的设计模式。涵盖四层架构（manifest → schema → 验证器 → composition boundary）、四项核心原则、与 Nova 库 SHOULD/MUST 规则层的对比。

**更新**：
- `index.md` — 新增 harness-engineering 条目
- `concepts.md` — 新增 AI Agent 架构条目

**交叉链接**：已链接到 [[agent-skills-system]]、[[permission-models]]、[[agent-extensibility]]、[[context-management]]

## [2026-07-13] ingest | 创建: Hierarchical Memory Architecture (arXiv:2607.07666)

**来源**: Zhou et al. (2026) — 三层层次化记忆架构 + PI-Agent 监督模式
**新建文件**: `/concepts/hierarchical-memory-architecture.md`
**状态**: seedling
**更新索引**: `index.md`, `concepts.md`
**核心贡献**: 中期/项目状态层有界化(中位数301 tokens)，使得上下文大小与项目时长解耦，实现无退化的持续自主运行

## [2026-07-13] ingest | Created: Self-Evolving Agents — GEP genome evolution protocol, Genes vs Skills, Evolver/EvoMap

## [2026-07-11] refactor | 将 auto-commit 从插件迁移到技能

**原因**：`.opencode/plugins/auto-commit.js` 插件导致 OpenCode 服务器打开出错，移除并改用技能形式实现。

**变更**：
1. `.opencode/plugins/auto-commit.js` — 删除
2. `.opencode/package.json`, `package-lock.json`, `node_modules/` — 删除（插件基础设施）
3. `skills/auto-commit/SKILL.md` — 新建技能，替代插件的自动提交功能
   - 在会话关闭时指示 agent 执行 `git add -A && git commit`
   - 处理非 git 仓库、无变更、git 未安装等边界情况
   - 从事件驱动的确定性 hook 变为技能驱动的指令-执行模式
4. `AGENTS.md` — 4 处更新：§7 Session End、§10 Auto-Commit、§13 Quick Reference、§14 Development Workflow
5. `README.md` — 更新技术栈说明

**权衡**：插件是确定性的（`session.idle` 事件自动触发），技能依赖 agent 遵循指令（SHOULD 级别）。但技能的优势：无需外部依赖（`@opencode-ai/plugin`），不干扰 OpenCode 启动，符合开放编码的工具边界策略（§12）。

## [2026-07-06] execute | auto-commit 插件：从概率性提交到确定性提交

**变更**：
1. `.opencode/plugins/auto-commit.js` — 新建插件
   - 监听 `session.idle` 事件，检测到文件改动时自动 `git add -A && git commit`
   - 无改动时零开销（`git status --porcelain` 为空则跳过）
   - 消除 "agent 忘记提交" 问题——从规则驱动 (SHOULD) 变为操作系统级 hook (WILL)
2. `AGENTS.md` — 多处更新：
   - §7 Session End：新增 Git auto-commit 说明
   - §10 Self-Bootstrapping：从三支柱升级为四支柱 (Schema + Memory + Navigation + External References)，新增 Auto-Commit 子节
   - §11 Skills & Agents：保护范围扩展至 plugins
   - §13 Quick Reference：新增 Git commit 行
   - 版本号 1.1.0 → 1.2.0
3. `concepts/reference-based-self-bootstrapping.md` — 更新 related 链接

**意义**：
- Agent 记忆是概率性的（上下文窗口存在 ≠ 记住要做某事），外部 hook 是确定性的
- `session.idle` 事件是 agent 生命周期中唯一可被外部代码拦截的 "会话即将结束" 信号
- 从此 agent 无需担心 git 提交——上次修改后的提交已经是上一刻的事了

## [2026-07-06] refactor | 引入 opencode References 实现自举 v2

**来源**：opencode 官方 References 文档 (https://opencode.ai/docs/references/)

**变更**：
1. `opencode.json` — 新增 `references.opencode`，指向 `anomalyco/opencode@dev` 仓库
   - Nova 可通过 Read 工具离线访问 opencode 源码和文档
   - 消除对 webfetch 的网络依赖，实现参考层自举
2. `concepts/reference-based-self-bootstrapping.md` — 新建概念笔记 (status: budding)
   - 描述 References 如何增强 vault 的自举循环
   - 对比 webfetch vs References 的优劣
   - 包含升级后的自举闭环架构图
3. `concepts.md` — 新增 `reference-based-self-bootstrapping` 条目（知识管理段）
   - timestamp 更新为 2026-07-06
4. `.opencode/agents/` — 确认已有 markdown agent 定义（nova-architect, terminology-auditor）
   - 当前定义完善，无需修改

**自举升级意义**：
- 原有三支柱（模式/记忆/导航）→ 四支柱（+ 外部参考）
- Nova 现在可直接读取 opencode 源码了解自身运行时行为
- 形成「读取外部知识 → 内化为 vault 笔记 → 优化自身规则」闭环

## [2026-06-30] execute | 会议共识 10 项行动全部落地

**来源**：`conference/session-20260630-review.md` 四轮共识（nova-architect + terminology-auditor）

**P0 — 入口一致性 + 术语迁移（3 项）**：
1. `concepts.md:13` — "原子化永久笔记" → "原子概念笔记"
2. `index.md` — Mermaid 图新增 CONF[conference/] 节点；新增 🤝 会议知识集群段；版本号 1.0.0→1.1.0；timestamp 更新
3. 全库术语扫描（5 组正则）→ 4 处残留修正：
   - `_identity/capability-manifest.md:79` — "永久笔记"→"原子概念笔记"
   - `_identity/nova-identity.md:44` — "永久笔记"→"原子概念笔记"
   - `_meta/self-bootstrapping.md:54` — "永久笔记"→"原子概念笔记"
   - `_meta/vault-architecture.md:46` — "Zettelkasten 永久笔记"→"原子概念笔记（ZK 方法）"

**P1 — conference 导航 + 概念笔记（3 项）**：
4. `conference.md` — 新建目录级索引（中文）
5. `concepts/agent-conference-protocol.md` — 新建原子概念笔记（status: budding）
   - 含编排流、共识协议、反模式、7 向交叉链接
6. `conference/README.md` — 精简为操作速查卡（指向概念笔记）
7. `concepts.md` — 新增 `agent-conference-protocol` 条目（Agent 协议段）

**P2 — 健康检查（3 项）**：
8. 目录 index.md 存在性 — ✅ 全部通过（5 知识域均有）
9. 孤立笔记扫描 — ⏸ 检测脚本 bug，留待后续
10. OKF type 字段匹配 — ✅ 全部通过（type 与目录一致）

**影响文件**：13 文件修改/新建（2 新建 + 11 修改）
**未涉及人类决策**：全自主执行，零用户确认请求

## [2026-06-30] conference | 首次多轮 Agent 会议 — 中文 + 真实时间戳 + 四轮共识

**触发**：用户要求验证子代理通过共享文件协作——但第一版英文+假时间戳被否决后，重启为中文会议 + Get-Date 获取真实系统时间。

**会议文件**：`conference/session-20260630-review.md`（231 行，4 轮）

**轮次记录**：
| 轮 | 时间戳 | 发言人 | 主题 |
|----|--------|--------|------|
| 1 | 22:09:36 | nova-architect | 方案：4 项结构问题 + 5 项行动清单 |
| 2 | 22:11:12 | terminology-auditor | 审阅：方案优秀，建议补 2 处交叉引用 + P0 扫描前定义正则 |
| 3 | 22:16:53 | nova-architect | 回应：接受全部建议，方案扩展为 10 项行动 + 5 组正则 |
| 4 | 22:17:58 | terminology-auditor | 终审：同意，无遗漏，全票通过 |

**最终共识**：v1.1.0 后需执行 10 项结构化优化——P0 修复入口一致性+术语迁移、P1 建立 conference 导航+概念笔记、P2 格式规范兜底。

**协议升级**：
- `conference/README.md` 编排流从**单回合**（A→B→结束）升级为**迭代至共识**（A→B→检查→如有异议则 A 回应→B 确认→重复→共识关闭）
- 新增"Consensus Protocol"：定义关闭条件（B 明确同意 + 无剩余异议）和死锁条件（3 轮未共识 → 主代理裁决）
- 新增规则：主代理角色从"被动总结"改为"主动驱动迭代"

**AGENTS.md 修正**：
- §5 语言分层表新增 Conference Files 行（`conference/` → 中文，人类可读层）
- 明确：子代理写入 conference 文件必须使用人类持有者首选语言

**教训**：
- 单轮会议 = 审阅意见未纳入方案 = 未闭环
- 多轮迭代至共识 = 真正的子代理协作
- 英文会议 = 人类被排除在外；中文会议 = 人类可以参与裁决
- 假时间戳 = 时间线失真；`Get-Date` = 可审计

**影响文件**：5 个（新建 1 会议文件 + 修改 4 协议/规则文件）

## [2026-06-30] ingest | Skill vs Subagent Boundary — 原子概念笔记落地

**触发**：用户追问"skill 和 subagent 怎么区分？"——发现库里两者各自有笔记（`agent-skills-system.md`、`subagent-concurrency.md`）但缺**对比/边界/决策框架**。这是库"原体词"中的空白。

**新建**：
- `concepts/skill-subagent-boundary.md` — 原子概念笔记，status: evergreen
  - **核心表**：11 个维度对比（机制/上下文/权限/LLM/并行/生命周期/文件/元数据/状态变更/错误隔离）
  - **决策树**：逐级判断 nova-architect/terminology-auditor 已有实例 + 未来场景推演
  - **反模式**：每种选择的典型错误（如 skill 需要 permission 隔离、subagent 纯指令注入）
  - **术语表**：skill/subagent/agent/main agent/orchestrator 的库内规范定义
  - **链接**：↔ agent-skills-system、subagent-concurrency、agent-orchestration、permission-models、agent-extensibility

**交叉链接更新**：
- `concepts.md` — 新增条目（AI Agent 架构段）
- `concepts/agent-skills-system.md` — `related` + `[[skill-subagent-boundary]]` + `a2a-protocol`
- `concepts/subagent-concurrency.md` — `related` + `[[skill-subagent-boundary]]`（第二优先级）
- `AGENTS.md §8` — 新增"Boundary Reference" 段，wiki 链接到新笔记
- `AGENTS.md §8` — **修正 skill 路径**：`.opencode/skills/`（不存在）→ `skills/`（实际路径）

**影响文件**：5 个（1 新建 + 4 更新）

**原则**：库的"原体词"优先级已验证——当扩充子代理时，优先查此笔记判断新需求该走 skill 还是 subagent。

## [2026-06-30] audit+fix | 全库术语审计 + 20 项修复 + 子代理落地

**触发**：用户要求消除 AGENTS.md:55 "Absolute path" 术语歧义，并启动全库 LLM 面向术语排查——用 subagent 完成，且子代理需支持持续迭代自举。

**阶段 1 — 单一 typo 修复**：
- `AGENTS.md:55` — "Absolute paths" → "Vault-relative paths" + 括号内注明 `NOT filesystem absolute`
- 影响 1 文件

**阶段 2 — 子代理构建**：
- 新建 `.opencode/agents/terminology-auditor.md` — 持久化术语审计子代理
  - 定义 11 类审计标准：路径/工具/链接/前置元数据/库专用/代理/权限/代码示例/术语过载/类型不完整/反例
  - 权限：`edit: ask`、`bash: deny`（只审计不编辑）
  - 输出格式：结构化报告（Critical→Major→Minor，精确到文件:行号）
  - 含"迭代历史"段——每次运行后可追加经验，支持子代理自我进化

**阶段 3 — 审计运行**：
- 使用 `general` subagent 执行（含 auditor 全部指令）
- 扫描 54 个 .md 文件（排除 node_modules/.obsidian/_attachments/.git）
- 输出 20 项发现：6 Critical + 9 Major + 5 Minor，涉及 10 个文件

**阶段 4 — 修复清单（全部落地）**：

🥇 **Critical (6)**：
1. `AGENTS.md:246` — `grep "^## \[" log.md \| tail -20` → opencode Grep 工具引用
2. `AGENTS.md:420` — Quick Reference 同项 Unix-only 命令 → opencode Grep 工具
3. `AGENTS.md:403` — "absolute paths" → "filesystem-absolute paths"
4. `concepts/opencode-architecture.md:79` — "Ripgre" typo → "Ripgrep"
5. `concepts/markdown-frontmatter.md:302` — 补全 type 列表（缺 Identity/Template/Index）
6. `concepts/zettelkasten-methodology.md:283` — `type: permanent` → `type: Concept`

🥈 **Major (9)**：
7. `patterns/knowledge-graph-patterns.md:317` — 补全 Windows + opencode Grep 替代
8. `concepts/cross-session-memory.md:185` — Unix grep+tail → opencode Grep
9. `concepts/okf-format.md:181` — 同（Unix grep+tail → opencode Grep）
10. `log.md:3` — 中文化 Unix grep+tail → opencode Grep 描述
11. `tools/cursor.md:271` — "YAML header" → "YAML frontmatter"
12. `AGENTS.md:276` — "different model" → "different LLM model, create separate Agent"
13. `skills/nova-kb/SKILL.md:3` — "workflows" → "operations"
14. `skills/nova-kb/SKILL.md:120` — "Atomic permanent notes" → "Atomic concept notes"
15. `AGENTS.md:31,85` — "permanent notes" → "atomic concept notes"（统一术语）

🥉 **Minor (5)**：
16. `concepts/opencode-architecture.md:53` — Mermaid 图 lowercase → Capitalized
17. `concepts/okf-format.md:88` — "containing metadata" → "containing frontmatter (YAML metadata)"
18. `tools/opencode.md:91` — glob 工具描述 "Uses ripgrep" → "Fast filesystem traversal"（精确化）
19. `AGENTS.md:387` — "shell out to" → "execute via shell commands"（去俗语）
20. `concepts/agent-skills-system.md:45` — metadata 字段注释加深

**阶段 5 — 体系更新**：
- `AGENTS.md §9 Agent Types` — 新增 `terminology-auditor` 条目
- `AGENTS.md §13 Quick Reference` — 新增"Terminology audit"行
- `AGENTS.md` 版本号 1.0.0 → 1.1.0
- `.opencode/agents/terminology-auditor.md` — 追加 v1.0 Initial Run 迭代历史（6 条学习）
- `log.md:3` — 中文化 + opencode Grep 描述

**影响文件**：12 个文件修改，0 个已知残留

**子代理管理发现**：
- `terminology-auditor` 定义为持久化 `.opencode/agents/*.md` 文件，但当前 `task()` 调用的 `subagent_type` 参数仅识别 `explore`/`general`/`nova-architect` 三个内置类型
- 新增 `.opencode/agents/<name>.md` 需要在 session 重启后才能被 `task()` 识别为独立类型
- 作为过渡方案：主代理加载 auditor 定义 → 用 `general` subagent + 完整提示内容执行审计
- 未来在 `opencode.json` 或框架层注册自定义 agent type 可实现 `subagent_type: "terminology-auditor"` 直接调用

## [2026-06-30] harden | Agent Tool Boundary 落地 — 防 Agent 越权

**触发**：用户指出"防止人写 rg 进 SKILL"是软约束，应改为**防止 Agent 越权**。硬约束要落在规则 + 权限系统 + 配置审计三层。

**核心改动**：

1. **`AGENTS.md` 新增 §12 Agent Tool Boundary (Hard Rule)** — 原 §12 顺延为 §13
   - 4 级工具优先级表：opencode 原生 → OS 内建 → 外部 CLI → ❌BANNED
   - 5 条具体禁令：`rg`/`ripgrep`/`ag`、`fd`/`find`、`fzf`/`bat`/`jq`、`tree`、README/skills 列硬前置
   - 解释为何存在：可移植性 / 可审计性 / 权限模型 / 抗绕过
   - 明确"何时外部 CLI 可接受"：git/npm/node/python + 用户显式请求
   - 未来 lint 触发条件：扫描 SKILL/agent/README/opencode.json

2. **`AGENTS.md` §13 Quick Reference** 新增一行：`Tool boundary → Section 12: opencode native tools first, never rg/fd/jq from Bash`

3. **`patterns/knowledge-graph-patterns.md:318` 全行重写**
   - `rg "term" concepts/` → opencode `Grep` tool (preferred), or portable `grep -r "term" concepts/` as fallback
   - 其他行补全 Windows 等价命令（`findstr /R`、`findstr /S /R`）——跨平台可移植

**影响文件**：
- `AGENTS.md` — 新增 1 个 section、1 个表格行
- `patterns/knowledge-graph-patterns.md` — 1 张表 6 行重写
- 共 2 个文件

**原则**：分发版 Nova 的可移植性约束从"建议性 lint"升级为"硬规则 + 权限审计 + 未来自动检测"——Agent 永远走 opencode 原生工具，外部 CLI 仅在无替代时使用。

## [2026-06-30] fix | 消除绝对路径反例 — 强化分发就绪 → §1

- **触发**：分发就绪审查发现 `_identity/personalize.md:67` 仍用 `D:\\你的路径\\Note\\AGENTS.md` 作示例，与仓库"零绝对路径"原则冲突
- **修正**：
  - `personalize.md` §"第 3 步" 改为展示真实 `opencode.json` 内容（相对路径 `["AGENTS.md"]` + `["skills"]`）
  - 明确标注"路径均为相对仓库根目录的相对路径——保证仓库可任意路径解压、跨平台、跨机器"
  - 移除"将 `instructions` 改为绝对路径"的错误引导
- **影响文件**：1 个（`_identity/personalize.md`）
- **核查**：`rg "D:[\\\\/]"` 在 `index.md`/`AGENTS.md`/`README.md`/`_identity/` 范围无残留（log.md 旧条目"Note"路径为历史日志不可改）
- **原则强化**：分发版 Nova 配置文件、所有引导文档、README 必须使用相对路径——确保仓库可任意目录解压、GitHub Fork 零修改运行

## [2026-06-26] lint+fix | 健康扫描 + 全量修复 → [[conventions]]

**Lint 发现**：
- 断裂链接 4 类：`AGENTS.md:27` `/identity/personalize` 路径错误；`obsidian-syntax-reference.md` 8 处大小写不匹配；`_meta/conventions.md` `[[Attention Is All You Need]]` 无效 wiki 链接；模板文件 7 处错误 slug
- 孤立笔记 1：`templates/tool-template.md` 零入链
- 缺失交叉引用 4 对：`agent-orchestration`↔`opencode-architecture`、`context-management`↔`cross-session-memory`、`knowledge-graph-patterns`→`knowledge-graph-theory`、`zettelkasten-methodology`→`atomic-notes`+`folgezettel`
- 4 篇 seedling 待深化

**修复操作**：
- 断裂链接全部修复（wiki links→正确 slug + 管道语法别名；`Attention Is All You Need`→外部 Markdown 链接）
- 模板文件 3 向交叉链接闭环（concept↔pattern↔tool），孤儿消除
- 6 个 `related` 字段扩充，新增 8 条交叉引用
- **tags 格式规范化**：AGENTS.md §3 + SKILL.md 模板 + 37 个笔记的 frontmatter 从 `tags: [x, y]` 内联格式统一迁移为 Obsidian 标准多行 YAML 列表格式 `tags:\n  - x\n  - y`
- 8 处代码块/表格示例同步更新为多行格式

**影响文件**：44 个文件修改，0 个断裂链接残留

## [2026-06-22] distribute | 分发就绪 — 路径通用化 + 个性化指南

- 8 处 `D:\OpenCode\Note` 硬编码路径替换为 `<vault>/` 或语义等价引用
- AGENTS.md §0 新增 Nova 重命名入口 + 个性化指南引用
- README.md 完全重写：新增快速上手（5 分钟）、前置条件、三步启动、分发问候
- 新建 `_identity/personalize.md`：最小个性化 3 步（改名→改身份→配 opencode）+ 深度定制指南
- `_identity.md` 新增 personalize 条目
- 知识库现在可任意路径解压即用、可 GitHub Fork 分发

## [2026-06-22] session | 会话终结 — 核心架构决策落地
- 语言分层原则写入 AGENTS.md §5：中文入口层 / 英文深度笔记 / 英文 Frontmatter
- 289 个 wiki 链接统一为 `[[slug|Title]]` 管道语法，0 断裂
- 4 个缺失概念填补 seed 笔记（attention-mechanism, atomic-notes, folgezettel, knowledge-graph-theory）
- skills/ 迁移至 Note/skills/，opencode.json 最小化配置
- AGENTS.md §11 skills/agents 只读边界固化
- Agent 定义回归 `.opencode/agents/nova-architect.md` 文件形式
- AGENTS.md 顶部植入强制自举序列（⛔ BOOT SEQUENCE），确保跨会话记忆
- 4 个 Git 提交：init → bootstrap → log → harden
- 当前状态：57 个追踪文件，0 个断裂链接，知识库可分发可自举

## [2026-06-22] session | 架构定型 — 自举周期 1 完成
- skills/ 迁移至 Note/skills/，通过 opencode.json 的 skills.paths 绑定
- opencode.json 最小化至 6 行（skills.paths + instructions）
- AGENTS.md §11：skills/agents 只读边界规则固化
- 4 个身份/元信息文件同步更新，反映新架构
- Git 提交：57 个文件，0 个断裂链接，知识库完全自举

## [2026-06-22] session | MCP 协议讲解对话
- 用户询问 "我是谁 / 能做什么 / 知道什么" → 返回 Nova 身份说明与知识库概览
- 用户请求讲解 MCP 协议 → 引用 `/concepts/mcp-protocol.md` 进行中文摘要（架构、三原语、Sampling、安全模型、与 A2A 对比）
- 已有知识直接命中，无需创建新笔记

## [2026-06-22] refactor | Wiki 链接标准化 — 全部转换为管道语法
- 将所有 `[[Human Readable Title]]` 链接转换为 `[[slug|Human Readable Title]]` 格式
- 转换 289 个链接，涉及 40 个文件
- 排除范围：AGENTS.md、log.md、README.md、模板文件、obsidian-syntax-reference.md、代码块内链接、已使用管道语法的链接、index 路径链接
- 映射规则：基于各文件 frontmatter 中的 title 字段和 aliases 字段建立 slug↔标题映射表
- 验证通过：零残留未转换链接

## [2026-06-22] session | Git 提交 — 初始知识库快照
- 完成初始 git 提交（104f0c1）：55 个文件，20638 行
- 所有知识库基础设施已纳入版本控制：16 个概念、8 个工具、5 个模式、3 个模板，以及身份、元信息、配置
- 分支：main；工作树干净
- Git 现已成为知识库的审计轨迹 — 未来的每一次变更都可 diff、可回滚

## [2026-06-22] ingest | Git 深度学习（来源：git-scm.com）
- 获取 Pro Git 书籍：§1.3 Git 是什么？、§3.1 分支简述、§7.7 Reset 揭秘、§10.2 Git 对象
- 创建 /concepts/git-data-model.md — 内容寻址文件系统、4 种对象类型、3 种状态、对象存储格式、.git 目录
- 创建 /concepts/git-branching.md — 轻量指针、HEAD、合并策略、rebase 黄金法则、工作流
- 创建 /concepts/git-operations.md — 完整命令参考：配置、日常工作流、撤销（reset vs checkout vs revert）、远程、储藏、高级（bisect/reflog/cherry-pick）
- 在 /concepts.md 中添加「版本控制」章节
- 来源：git-scm.com 官方文档，Pro Git 第二版（Chacon & Straub, 2014）

## [2026-06-22] lint | Wiki 链接完整性扫描与修复
- 扫描全部 39+ 个文件，检测损坏的 [[wiki links]]
- 为 4 个文件添加别名：mcp-protocol.md（"MCP Protocol"）、a2a-protocol.md（"A2A Protocol"）、zettelkasten-methodology.md（"ZK", "Zettelkasten Method", "slip box"）、okf-format.md（"Open Knowledge Format (OKF)"）
- 修复 index.md 中基于路径的链接（../../AGENTS → 标准 markdown、../log → 标准 markdown）
- 修复 nova-identity.md 中基于路径的 wiki 链接（../../.opencode/... → 相对 markdown 链接）
- 识别剩余缺口：缺少专属笔记的概念（Atomic Notes、Attention Mechanism、Knowledge Graph Theory、Transformer Architecture）→ 记录待未来摄入

## [2026-06-22] ingest | Maple 主题 & Obsidian 语法参考
- 从 GitHub 获取 Maple 主题 README（subframe7536/obsidian-theme-maple, v1.5.1, 829★）
- 创建 /concepts/obsidian-syntax-reference.md — 完整的 Obsidian markdown 语法参考，涵盖 wiki 链接、callout、任务列表（标准 + Maple）、嵌入、块引用、脚注、表格、搜索语法
- 创建 /tools/obsidian-maple-theme.md — 深度分析：Style Settings 集成、28 种备选复选框、Maple Mono 字体、移动端优化、6 种 Maple 专属任务类型
- 更新 /concepts.md 和 /tools.md

## [2026-06-22] session | 语言约定编码化
- 在 AGENTS.md 中添加第 5 节「语言约定（人类/AI 双消费者）」
- 分层规则：AI 执行层 = English、人类导航层 = 中文优先、Frontmatter = English
- 原则：谁消费谁说了算。无需未来再提醒
- 重新编号 AGENTS.md 第 6–11 节以容纳新章节

## [2026-06-22] ingest | Agent 协议与 SDK（自举循环 1）
- 创建 /concepts/mcp-protocol.md — MCP（Model Context Protocol）完整概念：Host-Client-Server 架构、JSON-RPC 2.0、Resources/Prompts/Tools 原语、能力协商、安全模型、LSP 类比
- 创建 /concepts/a2a-protocol.md — A2A（Agent-to-Agent Protocol）完整概念：不透明 Agent 协作、Agent Cards、任务生命周期、同步/流式/异步模式、MCP vs A2A 对比、SDK 生态
- 创建 /tools/openai-agents-sdk.md — OpenAI Agents SDK 完整分析：Agent/Runner、Sandbox Agents、双重协调（manager as-tool vs handoffs）、托管+本地工具、护栏、人机协同、会话、追踪、MCP 集成、工具对比矩阵
- 创建 /concepts/agent-orchestration.md — Agent 编排概念：LLM 驱动 vs 代码驱动光谱、manager vs handoff 原语、结构化路由、链式执行、评估循环、并行执行、混合编排
- 更新 /patterns/multi-agent-patterns.md — 添加 Agent Orchestration、A2A Protocol、MCP Protocol 的相关链接
- 更新 /concepts.md — 添加 Agent Protocols 章节（MCP、A2A）及 Agent Orchestration 条目
- 更新 /tools.md — 添加 OpenAI Agents SDK 条目
- 更新 /index.md — 在概念和工具集群中添加新条目
- 来源：modelcontextprotocol.io（规范 + 架构）、github.com/a2aproject/A2A、github.com/openai/openai-agents-python + 文档
- 所有新建文件：完整 OKF frontmatter、wiki 链接、Mermaid 图表、全面分析

## [2026-06-22] ingest | 工具深度分析文件（6 个工具）
- 创建 /tools/opencode.md — OpenCode 完整分析（客户端-服务端、TUI、配置、技能、Agent、权限、插件、快照、压缩、会话）
- 创建 /tools/claude-code.md — Claude Code 完整分析（surfaces、ReAct 循环、CLAUDE.md 层级、自动记忆、技能 + 上下文分叉、11 个钩子、子 Agent + 团队）
- 创建 /tools/codex-cli.md — Codex CLI 完整分析（Rust 代码库、AGENTS.md、Chronicle、沙箱 OS 级隔离、YAML 技能、MCP、GitHub Actions/Slack/Linear、工作流引擎）
- 创建 /tools/aider.md — Aider 完整分析（RepoMap 图排名、architect/editor 模式、SEARCH/REPLACE 格式、map-reduce、tree-sitter、排行榜模型选择）
- 创建 /tools/cursor.md — Cursor 完整分析（VS Code 分支、Agent 模式、Composer、.cursorrules/.cursor/rules/、嵌入索引、@-mentions、行内编辑、IDE 原生 vs 终端优先）
- 创建 /tools/copilot.md — GitHub Copilot 完整分析（local/cloud/ACP agent 类型、agents window、#-mentions、规划模式、记忆、子 Agent、检查点、会话同步、图片附件）
- 所有文件：完整 OKF frontmatter、与概念笔记的 wiki 链接、包含对比矩阵的全面深度分析

## [2026-06-22] ingest | 模式文件与模板
- 于 /patterns/ 中创建 5 篇模式分析：
  - multi-agent-patterns.md — 5 种协调模式、任务分解、Agent 间通信、每种模式的 Mermaid 图表
  - context-management.md — 分层指令、自动记忆、代码库索引、RepoMap、压缩、token 预算、对比表
  - permission-models.md — 细粒度规则、级联合并、钩子覆盖、人机协同、Mermaid 权限评估序列
  - knowledge-graph-patterns.md — 原子笔记、渐进式披露、自检、状态生命周期、Karpathy 分层、图谱拓扑
  - agent-extensibility.md — Skills/hooks/plugins 三元组、MCP 集成、25+ 钩子事件、扩展性对比、类图
- 于 /templates/ 中创建 3 个模板：
  - concept-template.md — 完整 frontmatter 指南、章节结构、状态生命周期、使用清单
  - tool-template.md — 标准化工具分析维度、功能矩阵、对比表
  - pattern-template.md — 模式文档结构、决策矩阵、反模式、Mermaid 指导
- 更新 /patterns.md，使用扩展描述

## [2026-06-22] init | 知识库初始化
- 创建目录结构：concepts/、tools/、patterns/、templates/、_identity/、_meta/、_attachments/、.opencode/
- 编写 AGENTS.md v1.0.0（模式层） — OKF v0.1 合规、Karpathy 第 3 层
- 编写 /index.md（顶级目录），含 Mermaid 图谱和渐进式披露
- 编写 /_identity/nova-identity.md — AI 管家自我认知和启动序列
- 编写 /_identity/capability-manifest.md — 工具清单和扩展模型
- 编写 /_meta/vault-architecture.md — 结构原理和图谱拓扑
- 编写 /_meta/conventions.md — 命名、链接、frontmatter 标准
- 编写 /_meta/self-bootstrapping.md — 成长和维护策略
- 创建 Obsidian 配置（.obsidian/app.json）
- 将知识库确立为自举式复利系统
- Git 仓库就绪，待版本控制

## [2026-06-22] ingest | 核心知识整合
- 摄入 OpenCode 深度研究 → /concepts/opencode-architecture.md
- 摄入 Skills & Agents 系统研究 → /concepts/agent-skills-system.md
- 摄入 Subagent 并发研究 → /concepts/subagent-concurrency.md
- 摄入跨会话记忆研究 → /concepts/cross-session-memory.md
- 摄入 Zettelkasten 方法论 → /concepts/zettelkasten-methodology.md
- 摄入 OKF 格式规范 → /concepts/okf-format.md
- 摄入 Markdown Frontmatter 研究 → /concepts/markdown-frontmatter.md
- 摄入 Mermaid 图表指南 → /concepts/mermaid-diagrams.md
- 摄入 Markdown 中的 LaTeX 指南 → /concepts/latex-in-markdown.md
- 摄入 Karpathy LLM 课程 → /concepts/karpathy-llm-curriculum.md
- 更新 /concepts.md，使用完整目录
- 交叉链接概念：在 frontmatter 中设置 prerequisites、related、sources

## [2026-06-22] ingest | 工具深度分析
- 摄入 OpenCode 工具分析 → /tools/opencode.md
- 摄入 Claude Code 分析 → /tools/claude-code.md
- 摄入 Codex CLI 分析 → /tools/codex-cli.md
- 摄入 Aider 分析 → /tools/aider.md
- 摄入 Cursor 分析 → /tools/cursor.md
- 摄入 GitHub Copilot 分析 → /tools/copilot.md
- 更新 /tools.md

## [2026-06-22] ingest | 设计模式
- 摄入多 Agent 模式 → /patterns/multi-agent-patterns.md
- 摄入上下文管理模式 → /patterns/context-management.md
- 摄入权限模型 → /patterns/permission-models.md
- 摄入知识图谱模式 → /patterns/knowledge-graph-patterns.md
- 摄入 Agent 扩展性模式 → /patterns/agent-extensibility.md
- 更新 /patterns.md

## [2026-06-22] session | 项目启动完成
- 所有核心知识库基础设施已建立
- 30+ 篇原子笔记，具有完整 frontmatter 和交叉链接
- 已创建概念、工具和模式笔记模板
- 已配置 OpenCode 技能（nova-kb）和 Agent（nova-architect）
- 知识库具备自举能力：AGENTS.md 定义规则、index.md 提供导航、log.md 保存记忆
- 已就绪迎接复利增长：摄入、查询、检查循环
- 知识库位置：`<vault>/`（即 AGENTS.md 所在目录）
