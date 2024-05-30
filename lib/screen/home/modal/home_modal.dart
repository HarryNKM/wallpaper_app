class WallpaperModal
{
  int? total,totalHits;
  List<HitsModal>? hits=[];

  WallpaperModal({this.total, this.totalHits, this.hits});
  factory WallpaperModal.mapToModal(Map m1)
  {
    List l1=m1['hits'];
    return WallpaperModal(hits: l1.map((e) => HitsModal.mapToModal(e),).toList(),total: m1['total'],totalHits: m1['totalHits']);
  }

}
class HitsModal
{
  String? previewURL,largeImageURL;

  HitsModal({this.previewURL, this.largeImageURL});

  factory HitsModal.mapToModal(Map m1)
  {
    return HitsModal(largeImageURL: m1['largeImageURL'],previewURL: m1['previewURL']);
  }
}