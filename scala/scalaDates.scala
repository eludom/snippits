// Scala/Java date utilities from
// https://alvinalexander.com/source-code/scala-java-date-to-string-to-date-long-methods

import java.text.SimpleDateFormat
import java.util.Date

object Utils {

  // See https://docs.oracle.com/javase/6/docs/api/java/text/SimpleDateFormat.html
  //val DATE_FORMAT = "EEE, MMM dd, yyyy h:mm a"
  val DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS"

  def getDateAsString(d: Date): String = {
    val dateFormat = new SimpleDateFormat(DATE_FORMAT)
    dateFormat.format(d)
  }

  def convertStringToDate(s: String): Date = {
    val dateFormat = new SimpleDateFormat(DATE_FORMAT)
    dateFormat.parse(s)
  }

}

def convertDateStringToLong(dateAsString: String): Long = {
    Utils.convertStringToDate(dateAsString).getTime
}

def convertLongToDate(l: Long): Date = new Date(l)
