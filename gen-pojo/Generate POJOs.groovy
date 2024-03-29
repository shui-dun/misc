import com.intellij.database.util.Case
import com.intellij.database.util.DasUtil

typeMapping = [
        // 对bigint的匹配应该放在对int的匹配上面，否则会先匹配到int
        (~/(?i)long|bigint/)              : "Long",
        (~/(?i)int/)                      : "Integer",
        (~/(?i)number/)                   : "String",
        (~/(?i)float|double|decimal|real/): "Double",
        (~/(?i)datetime|timestamp/)       : "java.util.Date",
        (~/(?i)date/)                     : "java.util.Date",
        (~/(?i)time/)                     : "String",
        (~/(?i)bit/)                      : "Boolean",
        (~/(?i)/)                         : "String"
]


//FILES.chooseDirectoryAndSave("Choose directory", "Choose where to store generated files") { dir ->
//    SELECTION.filter { it instanceof DasTable && it.getKind() == ObjectKind.TABLE }.each {
//        generate(it, dir) }
//}
// 不过滤，以产生视图
FILES.chooseDirectoryAndSave("Choose directory", "Choose where to store generated files") { dir ->
    SELECTION.each {
        generate(it, dir)
    }
}

def generate(table, dir) {
    def className = javaName(table.getName(), true)
    def fields = calcFields(table)
    // 自动检测包名，兼容不同的操作系统的路径分隔符
    def packageName = dir.getPath().replaceAll("\\\\", "/").replaceAll(".*src/main/java/", "").replaceAll("/", ".")
    new File(dir, className + "Do.java").withPrintWriter { out -> generate(out, className, fields, table, packageName) }
}

def generate(out, className, fields, table, packageName) {
    out.println "package ${packageName};"
    out.println ""
    // out.println "import javax.persistence.Column;"
    // out.println "import javax.persistence.Entity;"
    out.println "import com.baomidou.mybatisplus.annotation.TableId;"
    out.println "import com.baomidou.mybatisplus.annotation.TableName;"
    // out.println "import javax.persistence.Id;"
    // out.println "import javax.persistence.Table;"
    // out.println "import javax.persistence.GeneratedValue;"
    // out.println "import javax.persistence.GenerationType;"
    out.println "import lombok.AllArgsConstructor;"
    // out.println "import lombok.Builder;"
    out.println "import lombok.Data;"
    out.println "import lombok.NoArgsConstructor;"
    // out.println "import org.springframework.lang.NonNull;"
    out.println "import org.springframework.lang.Nullable;"
    out.println ""
    out.println "@TableName(\"" + table.getName() + "\")"
    // out.println "@Table(name = \""+table.getName() +"\")"
    // out.println "@Entity"
    out.println "@Data"
    // out.println "@Builder"
    out.println "@AllArgsConstructor"
    out.println "@NoArgsConstructor"
    out.println "public class ${className}Do {"
    fields.each() {
        out.println ""

        // if (it.primary) out.println "    @Id"
        if (it.primary) out.println "    @TableId"
        // out.print "    @Column(name = \"${it.colName}\""; if (it.primary) out.print ", updatable = false, nullable = false"; out.println ")"
        // if (it.primary) out.println "    @GeneratedValue(strategy = GenerationType.IDENTITY)"
        // 根据可空性添加注解
        if (it.nullable) {
            out.println "    @Nullable"
        } else {
            // out.println "    @NonNull"
        }
        out.println "    private ${it.type} ${it.name};"
    }

    out.println "}"
}

def calcFields(table) {
    DasUtil.getColumns(table).reduce([]) { fields, col ->
        def spec = Case.LOWER.apply(col.getDataType().getSpecification())

        def typeStr = typeMapping.find { p, t -> p.matcher(spec).find() }.value

        def comm = [
                name   : javaName(col.getName(), false),
                type   : typeStr,
                colName: col.getName(),
                primary: DasUtil.isPrimary(col),
                nullable: !col.isNotNull() // 获取列的可空性
        ]
        fields += [comm]
    }
}

def javaName(str, capitalize) {
    def s = com.intellij.psi.codeStyle.NameUtil.splitNameIntoWords(str)
            .collect { Case.LOWER.apply(it).capitalize() }
            .join("")
            .replaceAll(/[^\p{javaJavaIdentifierPart}[_]]/, "_")
    capitalize || s.length() == 1 ? s : Case.LOWER.apply(s[0]) + s[1..-1]
}
