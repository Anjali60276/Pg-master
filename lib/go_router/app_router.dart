import 'package:go_router/go_router.dart';
import 'package:pgmaster/pages/Dashboard_page.dart';
import 'package:pgmaster/pages/Tenants_page.dart';
import 'package:pgmaster/pages/fee_collection.dart';
import 'package:pgmaster/go_router/shell_page.dart';


//creating router object its like googles map im saying its fun to learn
//its know every page where it to navigate
final GoRouter appRouter = GoRouter(
   initialLocation: '/dashboard',  //this will say where app starts first it first go to dashboard its main page like homepage
   
   
   //list of all routes pages in app
  routes : [
    
    
    //common layout shared by multiple times
    
    //InGmail , the sidebar stays the same but gmail changes while poping up or in my app side bar its remain same only the pages will change 
    ShellRoute(
      
      //This builder creates the common layout
      builder: (context, state, child) {
        return ShellPage(
          
          
          
          //'child' is the page selected by the current route means example as i would say imagine a tv so tv frame never changes but its channel change so childis like channel 
          // ShellPage() => TV another examples house = door,windows,roof
          //and /
//           ShellPage(
//   child: DashboardPage(), //here its channel //another inside furniture will change
// )   =>
          
          
          
          
          child: child
          );
      },
      
      //pages that will use shellpage layout
      routes: [
        //Dashboard pages
        GoRoute(
          path: '/dashboard',//url is /dashboard
        builder: (context, state) => const DashboardPage(),//widgets displayed for this route
        ),
        
              GoRoute(
          path: '/tenants', //URL of tennats page
        builder: (context, state) =>  TenantsPage(), //here it shows tenants page
        ),
        
              GoRoute(  //Fees pages
          path: '/fees',  //Fees url anjali
        builder: (context, state) => FeesCollectionPage(), //Show the fees collection page
        ),
    
      ],
      
    ),
  ],
);